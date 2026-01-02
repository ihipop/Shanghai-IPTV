<?php
/**
 * IPTV M3U8 导出脚本
 * 支持新的数据库架构
 */

use Doctrine\DBAL;

require 'vendor/autoload.php';
include './common.inc.php';

$connectionParams = [
    'url' => $dbDSN,
];
$conn = DBAL\DriverManager::getConnection($connectionParams);

// 解析参数
$args = [];
parse_str($argv[1] ?? '', $args);
$udpxy = $args['udpxy'] ?? null;
$epgSource = $args['epg'] ?? 'sparks'; // 默认使用 sparks EPG
$exportAllRoutes = isset($args['all_routes']) && $args['all_routes'] === '1'; // 是否导出所有线路
$outputFile = $args['file'] ?? null; // 输出文件名

// 检查是否指定了输出文件
if (empty($outputFile) && !SERVER_MODE) {
    echo "用法: php export.php \"file=output.m3u8[&参数]\"\n";
    echo "\n";
    echo "参数说明:\n";
    echo "  file         - 输出文件名 (必需)\n";
    echo "  epg          - EPG源 (sparks|rytec|epg.pw, 默认: sparks)\n";
    echo "  all_routes   - 导出所有线路 (1=是, 默认: 仅主线路)\n";
    echo "  udpxy        - UDPXY服务器地址\n";
    echo "\n";
    echo "示例:\n";
    echo "  php export.php \"file=output.m3u8\"\n";
    echo "  php export.php \"file=output.m3u8&epg=rytec\"\n";
    echo "  php export.php \"file=output.m3u8&epg=sparks&all_routes=1\"\n";
    echo "  php export.php \"file=output.m3u8&udpxy=http://192.168.1.1:4022\"\n";
    exit(1);
}

// 查询频道数据
$queryBuilder = $conn->createQueryBuilder();
$queryBuilder
    ->select(
        'c.id',
        'c.name',
        'c.display_name',
        'c.category',
        'c.logo',
        'c.sort_order'
    )
    ->from('channels', 'c')
    ->orderBy('c.sort_order', 'ASC');

$channels = $queryBuilder->fetchAllAssociative();

$data = new \M3uParser\M3uData();
$data->setAttribute('name', '上海电信IPTV组播节目单');

// 输出进度信息到 STDERR
log_message("开始导出 M3U8...\n");
log_message("输出文件: {$outputFile}\n");
log_message("EPG 源: {$epgSource}\n");
log_message("导出模式: " . ($exportAllRoutes ? "所有线路" : "仅主线路") . "\n\n");

$exportedCount = 0;

foreach ($channels as $channel) {
    $channelId = $channel['id'];
    $channelName = $channel['name'];
    
    // 获取 EPG ID
    $epgId = null;
    $epgQuery = $conn->createQueryBuilder()
        ->select('epg_id')
        ->from('channel_epg_mappings')
        ->where('channel_id = :channel_id')
        ->andWhere('epg_source = :epg_source')
        ->setParameter('channel_id', $channelId)
        ->setParameter('epg_source', $epgSource)
        ->fetchAssociative();
    
    if ($epgQuery) {
        $epgId = $epgQuery['epg_id'];
    } else {
        // 如果没有EPG映射,使用频道名称作为tvg-id
        $epgId = $channelName;
    }
    
    // 获取流地址 (按清晰度优先级: 4K > HD > SD > LD)
    $streamQuery = $conn->createQueryBuilder()
        ->select('stream_url', 'quality', 'route_index', 'is_primary')
        ->from('channel_streams')
        ->where('channel_id = :channel_id')
        ->andWhere('status = :status')
        ->setParameter('channel_id', $channelId)
        ->setParameter('status', 'active')
        ->orderBy('CASE quality WHEN \'4K\' THEN 1 WHEN \'HD\' THEN 2 WHEN \'SD\' THEN 3 WHEN \'LD\' THEN 4 ELSE 5 END', 'ASC')
        ->addOrderBy('route_index', 'ASC');
    
    $streams = $streamQuery->fetchAllAssociative();
    
    if (empty($streams)) {
        log_message("警告: 频道 {$channelName} 没有可用的流地址\n");
        continue;
    }
    
    // 根据导出模式选择流
    $streamsToExport = [];
    if ($exportAllRoutes) {
        // 导出所有线路
        $streamsToExport = $streams;
    } else {
        // 只导出每个清晰度的主线路
        $qualitiesSeen = [];
        foreach ($streams as $stream) {
            $quality = $stream['quality'];
            if (!isset($qualitiesSeen[$quality])) {
                $streamsToExport[] = $stream;
                $qualitiesSeen[$quality] = true;
            }
        }
    }
    
    // 为每个流创建 M3U 条目
    foreach ($streamsToExport as $stream) {
        $streamUrl = $stream['stream_url'];
        $quality = $stream['quality'];
        $routeIndex = $stream['route_index'];
        
        // 转换 RTP 地址为 HTTP (如果提供了 udpxy)
        if (!empty($udpxy) && stripos($streamUrl, 'rtp://') === 0) {
            $streamUrl = rtrim($udpxy, ' \t\n\r\0\x0B/') . '/' . str_replace('://', '/', $streamUrl);
        }
        
        // 构建显示标题
        $displayName = $channel['display_name'] ?: $channelName;
        
        // 添加清晰度标签 (只有 4K 和 HD 显示)
        $qualityLabel = QUALITY_DISPLAY_MAP[$quality] ?? '';
        $title = $displayName . $qualityLabel;
        
        // 如果导出所有线路且有多条线路,添加线路编号
        if ($exportAllRoutes && $routeIndex > 1) {
            $title .= " 线路{$routeIndex}";
        }
        
        // 创建 M3U 条目
        $entry = new M3uParser\M3uEntry();
        $entry->setPath($streamUrl);
        
        $extInf = (new M3uParser\Tag\ExtInf())
            ->setDuration(-1)
            ->setTitle($title);
        
        $attributes = [
            'tvg-name' => $channelName,
            'group-title' => $channel['category'] ?: '未分类',
        ];
        
        if (!empty($epgId)) {
            $attributes['tvg-id'] = $epgId;
        }
        
        if (!empty($channel['logo'])) {
            $attributes['tvg-logo'] = $channel['logo'];
        }
        
        $extInf->setAttributes($attributes);
        $entry->addExtTag($extInf);
        $data->append($entry);
        
        $exportedCount++;
    }
}

log_message("\n导出完成!\n");
log_message("导出频道数: " . count($channels) . "\n");
log_message("导出条目数: {$exportedCount}\n");

if (!SERVER_MODE) {
    // 写入文件
    file_put_contents($outputFile, $data);
    log_message("文件已保存: {$outputFile}\n");
} else {
    return $data;
}
