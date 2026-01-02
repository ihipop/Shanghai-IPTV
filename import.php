<?php
/**
 * IPTV TXT 格式导入脚本
 * 支持新的数据库架构
 */

use Doctrine\DBAL;

require 'vendor/autoload.php';
include './common.inc.php';

$fileName = $argv[1] ?? './iptv.txt';

if (!file_exists($fileName)) {
    die("错误: 文件 {$fileName} 不存在\n");
}

$connectionParams = [
    'url' => $dbDSN,
];
$conn = DBAL\DriverManager::getConnection($connectionParams);

// 读取文件内容
$content = file_get_contents($fileName);
// 移除 BOM 和转换编码
$content = preg_replace('/^\xEF\xBB\xBF/', '', $content);
$lines = explode("\n", $content);

$currentCategory = '';
$sortOrder = 0;
$channelsData = []; // 临时存储频道数据

log_message("开始解析文件: {$fileName}\n");

foreach ($lines as $lineNum => $line) {
    $line = trim($line, "\r\n\t ");
    
    if (empty($line)) {
        continue;
    }
    
    // 检查是否是分类标记
    if (strpos($line, '#genre#') !== false) {
        $currentCategory = trim(str_replace('#genre#', '', $line));
        log_message("发现分类: {$currentCategory}\n");
        continue;
    }
    
    // 解析频道行: 频道名,流地址
    $parts = explode(',', $line, 2);
    if (count($parts) !== 2) {
        continue;
    }
    
    $channelNameRaw = trim($parts[0]);
    $streamUrl = trim($parts[1]);
    
    if (empty($channelNameRaw) || empty($streamUrl)) {
        continue;
    }
    
    // 识别清晰度
    $quality = 'SD'; // 默认标清
    $channelName = $channelNameRaw;
    
    // 检查频道名中的清晰度标识 (大小写不敏感)
    if (preg_match('/(4K|高清|标清|普清|HD|SD|LD)$/ui', $channelNameRaw, $matches)) {
        $qualityLabel = $matches[1];
        // 转换为大写进行匹配 (中文不受影响)
        $qualityLabelUpper = strtoupper($qualityLabel);
        
        if (isset(QUALITY_MAP[$qualityLabelUpper])) {
            $quality = QUALITY_MAP[$qualityLabelUpper];
            $channelName = trim(str_replace($qualityLabel, '', $channelNameRaw));
        }
    }
    
    // 存储到临时数组,按频道名分组
    if (!isset($channelsData[$channelName])) {
        $channelsData[$channelName] = [
            'name' => $channelName,
            'display_name' => $channelName,
            'category' => $currentCategory,
            'sort_order' => ++$sortOrder,
            'streams' => [],
        ];
    }
    
    // 添加流地址
    $channelsData[$channelName]['streams'][] = [
        'url' => $streamUrl,
        'quality' => $quality,
    ];
}

log_message("\n解析完成,共找到 " . count($channelsData) . " 个频道\n");
log_message("开始导入数据库...\n");

$conn->beginTransaction();

try {
    $insertedChannels = 0;
    $insertedStreams = 0;
    
    foreach ($channelsData as $channelData) {
        // 检查频道是否已存在
        $existingChannel = $conn->createQueryBuilder()
            ->select('id')
            ->from('channels')
            ->where('name = :name')
            ->setParameter('name', $channelData['name'])
            ->fetchAssociative();
        
        if ($existingChannel) {
            $channelId = $existingChannel['id'];
            log_message("频道已存在: {$channelData['name']} (ID: {$channelId})\n");
            
            // 更新频道信息
            $conn->createQueryBuilder()
                ->update('channels')
                ->set('category', ':category')
                ->set('sort_order', ':sort_order')
                ->set('updated_at', ':updated_at')
                ->where('id = :id')
                ->setParameter('category', $channelData['category'])
                ->setParameter('sort_order', $channelData['sort_order'])
                ->setParameter('updated_at', date('Y-m-d H:i:s'))
                ->setParameter('id', $channelId)
                ->executeStatement();
            
            // 删除旧的流地址
            $conn->createQueryBuilder()
                ->delete('channel_streams')
                ->where('channel_id = :channel_id')
                ->setParameter('channel_id', $channelId)
                ->executeStatement();
        } else {
            // 插入新频道
            $conn->createQueryBuilder()
                ->insert('channels')
                ->values([
                    'name' => ':name',
                    'display_name' => ':display_name',
                    'category' => ':category',
                    'sort_order' => ':sort_order',
                    'created_at' => ':created_at',
                    'updated_at' => ':updated_at',
                ])
                ->setParameter('name', $channelData['name'])
                ->setParameter('display_name', $channelData['display_name'])
                ->setParameter('category', $channelData['category'])
                ->setParameter('sort_order', $channelData['sort_order'])
                ->setParameter('created_at', date('Y-m-d H:i:s'))
                ->setParameter('updated_at', date('Y-m-d H:i:s'))
                ->executeStatement();
            
            $channelId = $conn->lastInsertId();
            $insertedChannels++;
            log_message("插入新频道: {$channelData['name']} (ID: {$channelId})\n");
        }
        
        // 插入流地址
        // 按清晰度分组,计算每个清晰度的线路编号
        $streamsByQuality = [];
        foreach ($channelData['streams'] as $stream) {
            $quality = $stream['quality'];
            if (!isset($streamsByQuality[$quality])) {
                $streamsByQuality[$quality] = [];
            }
            $streamsByQuality[$quality][] = $stream['url'];
        }
        
        foreach ($streamsByQuality as $quality => $urls) {
            foreach ($urls as $index => $url) {
                $routeIndex = $index + 1;
                $isPrimary = ($routeIndex === 1) ? 1 : 0;
                
                $conn->createQueryBuilder()
                    ->insert('channel_streams')
                    ->values([
                        'channel_id' => ':channel_id',
                        'stream_url' => ':stream_url',
                        'quality' => ':quality',
                        'route_index' => ':route_index',
                        'is_primary' => ':is_primary',
                        'status' => ':status',
                        'created_at' => ':created_at',
                        'updated_at' => ':updated_at',
                    ])
                    ->setParameter('channel_id', $channelId)
                    ->setParameter('stream_url', $url)
                    ->setParameter('quality', $quality)
                    ->setParameter('route_index', $routeIndex)
                    ->setParameter('is_primary', $isPrimary)
                    ->setParameter('status', 'active')
                    ->setParameter('created_at', date('Y-m-d H:i:s'))
                    ->setParameter('updated_at', date('Y-m-d H:i:s'))
                    ->executeStatement();
                
                $insertedStreams++;
            }
        }
    }
    
    $conn->commit();
    
    log_message("\n导入完成!\n");
    log_message("插入频道数: {$insertedChannels}\n");
    log_message("插入流地址数: {$insertedStreams}\n");
    
} catch (Exception $e) {
    $conn->rollBack();
    log_message("\n错误: " . $e->getMessage() . "\n");
    exit(1);
}
