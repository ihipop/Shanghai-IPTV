<?php
/**
 * @author ihipop@gmail.com @ 2021/7/28 下午1:55 For Shanghai-IPTV.
 * IPTV TXT 格式导入脚本
 * 支持新的数据库架构
 */

use Doctrine\DBAL;

require 'vendor/autoload.php';
include './common.inc.php';

$fileName = $argv[1] ?? './iptv.txt';
$defaultQuality = $argv[2] ?? 'HD'; // 默认清晰度,当频道名中没有清晰度标识时使用

// 验证默认清晰度参数
$validQualities = ['4K', 'HD', 'SD', 'LD'];
if (!in_array($defaultQuality, $validQualities)) {
    die("错误: 无效的默认清晰度 '{$defaultQuality}'\n有效值: " . implode(', ', $validQualities) . "\n");
}

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
    $line = trim($line);
    if (empty($line)) {
        continue;
    }
    
    // 检查是否是分类标记
    // 如果逗号后面不是带协议的 URL,则认为是分类
    if (strpos($line, ',') !== false) {
        list($part1, $part2) = explode(',', $line, 2);
        $part2 = trim($part2);
        
        // 检查第二部分是否是带协议的 URL (rtp://, http://, https://, udp://, etc.)
        if (!preg_match('/^[a-z]+:\/\//i', $part2)) {
            // 不是 URL,是分类标记
            $currentCategory = trim($part1);
            log_message("发现分类: {$currentCategory}\n");
            continue;
        }
    }
    
    // 解析频道和流地址
    $parts = explode(',', $line, 2);
    if (count($parts) !== 2) {
        continue;
    }
    
    $channelNameRaw = trim($parts[0]);
    $streamUrl = trim($parts[1]);
    
    if (empty($channelNameRaw) || empty($streamUrl)) {
        continue;
    }
    
    // 识别清晰度 (可出现在任意位置,大小写不敏感)
    $quality = $defaultQuality;
    $channelName = $channelNameRaw;
    
    // 匹配所有清晰度标识: 4K, HD, SD, LD, 高清, 标清, 普清
    if (preg_match('/(4K|HD|SD|LD|高清|标清|普清)/ui', $channelNameRaw, $matches)) {
        $qualityLabel = $matches[1];
        $qualityLabelUpper = strtoupper($qualityLabel);
        
        // 通过 QUALITY_MAP 映射到标准清晰度
        if (isset(QUALITY_MAP[$qualityLabelUpper])) {
            $quality = QUALITY_MAP[$qualityLabelUpper];
            $channelName = trim(str_replace($qualityLabel, '', $channelNameRaw));
        }
    }
    
    // 根据清晰度决定分类和频道key
    $targetCategory = $currentCategory;
    $channelKey = $channelName;
    
    if ($quality === '4K') {
        // 4K流使用单独的"4K频道"分类
        $targetCategory = '4K频道';
        $channelKey = $channelName . '|4K频道'; // 使用组合key避免与原频道冲突
    } else {
        // 非4K流使用原分类
        $channelKey = $channelName . '|' . $currentCategory;
    }
    
    // 存储到临时数组,按频道名+分类分组
    if (!isset($channelsData[$channelKey])) {
        $sortOrder++;
        $channelsData[$channelKey] = [
            'name' => $channelName,
            'display_name' => $channelName,
            'category' => $targetCategory,
            'sort_order' => $sortOrder,
            'streams' => [],
        ];
    }
    
    // 添加流地址
    $channelsData[$channelKey]['streams'][] = [
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
        // 检查频道是否已存在 (按名称和分类查询)
        $existingChannel = $conn->createQueryBuilder()
            ->select('id')
            ->from('channels')
            ->where('name = :name')
            ->andWhere('category = :category')
            ->setParameters([
                'name' => $channelData['name'],
                'category' => $channelData['category'],
            ])
            ->fetchAssociative();
        
        if ($existingChannel) {
            $channelId = $existingChannel['id'];
            log_message("频道已存在: {$channelData['name']} [{$channelData['category']}] (ID: {$channelId})\n");
            
            // 更新频道信息
            $conn->createQueryBuilder()
                ->update('channels')
                ->set('category', ':category')
                ->set('sort_order', ':sort_order')
                ->set('updated_at', ':updated_at')
                ->where('id = :id')
                ->setParameters([
                    'category' => $channelData['category'],
                    'sort_order' => $channelData['sort_order'],
                    'updated_at' => date('Y-m-d H:i:s'),
                    'id' => $channelId,
                ])
                ->executeStatement();
            
            // 删除旧的流地址
            $conn->createQueryBuilder()
                ->delete('channel_streams')
                ->where('channel_id = :channel_id')
                ->setParameters(['channel_id' => $channelId])
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
                ->setParameters([
                    'name' => $channelData['name'],
                    'display_name' => $channelData['display_name'],
                    'category' => $channelData['category'],
                    'sort_order' => $channelData['sort_order'],
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s'),
                ])
                ->executeStatement();
            
            $channelId = $conn->lastInsertId();
            $insertedChannels++;
            log_message("插入新频道: {$channelData['name']} [{$channelData['category']}] (ID: {$channelId})\n");
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
        
        // 插入流地址
        $processedStreams = [];
        foreach ($streamsByQuality as $quality => $urls) {
            foreach ($urls as $index => $url) {
                $processedStreams[] = [
                    'stream_url' => $url,
                    'quality' => $quality,
                    'route_index' => $index + 1,
                ];
            }
        }

        foreach ($processedStreams as $streamData) {
            $routeIndex = $streamData['route_index'];
            
            $conn->createQueryBuilder()
                ->insert('channel_streams')
                ->values([
                    'channel_id' => ':channel_id',
                    'stream_url' => ':stream_url',
                    'quality' => ':quality',
                    'route_index' => ':route_index',
                    'status' => ':status',
                    'created_at' => ':created_at',
                    'updated_at' => ':updated_at',
                ])
                ->setParameters([
                    'channel_id' => $channelId,
                    'stream_url' => $streamData['stream_url'],
                    'quality' => $streamData['quality'],
                    'route_index' => $routeIndex,
                    'status' => 'active',
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s'),
                ])
                ->executeStatement();
            
            $insertedStreams++;
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
