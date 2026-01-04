<?php
/**
 * 台标更新脚本
 * 扫描台标目录,根据频道名称匹配台标文件,更新数据库中的 logo 字段
 */

use Doctrine\DBAL;

require 'vendor/autoload.php';
include './common.inc.php';

// 配置
$logoDir = $argv[1] ?? './tv-logo'; // 台标目录,默认为 ./tv-logo
$dryRun = isset($argv[2]) && $argv[2] === '--dry-run'; // 是否为预览模式

if (!is_dir($logoDir)) {
    die("错误: 台标目录 {$logoDir} 不存在\n");
}

echo "台标更新脚本\n";
echo "============\n";
echo "台标目录: {$logoDir}\n";
echo "运行模式: " . ($dryRun ? "预览模式 (不会修改数据库)" : "更新模式") . "\n\n";

// 连接数据库
$connectionParams = ['url' => $dbDSN];
$conn = DBAL\DriverManager::getConnection($connectionParams);

// 只支持 PNG 格式
$imageExtensions = ['png'];

// 扫描台标目录
echo "正在扫描台标目录...\n";
$logoFiles = [];
foreach (scandir($logoDir) as $file) {
    if ($file === '.' || $file === '..') {
        continue;
    }
    
    $filePath = $logoDir . '/' . $file;
    if (!is_file($filePath)) {
        continue;
    }
    
    // 检查是否是图片文件
    $ext = strtolower(pathinfo($file, PATHINFO_EXTENSION));
    if (!in_array($ext, $imageExtensions)) {
        continue;
    }
    
    // 获取文件名(不含扩展名)作为频道名
    $channelName = pathinfo($file, PATHINFO_FILENAME);
    $logoFiles[$channelName] = $file;
}

echo "找到 " . count($logoFiles) . " 个台标文件\n\n";

// 查询所有频道
$channels = $conn->createQueryBuilder()
    ->select('id', 'name', 'category', 'logo')
    ->from('channels')
    ->orderBy('category', 'ASC')
    ->addOrderBy('name', 'ASC')
    ->fetchAllAssociative();

echo "数据库中共有 " . count($channels) . " 个频道\n\n";

// 统计
$matched = 0;
$updated = 0;
$skipped = 0;

echo "开始匹配台标...\n";
echo str_repeat('-', 80) . "\n";

foreach ($channels as $channel) {
    $channelId = $channel['id'];
    $channelName = $channel['name'];
    $category = $channel['category'];
    $currentLogo = $channel['logo'];
    
    // 检查是否有匹配的台标文件
    if (isset($logoFiles[$channelName])) {
        $logoFile = $logoFiles[$channelName];
        
        $matched++;
        
        // 如果已经有 logo 且与当前匹配的相同,并且文件存在,则跳过
        if ($currentLogo && file_exists($logoDir . '/' . $currentLogo)) {
            $skipped++;
            echo "[跳过] {$channelName} [{$category}] - 已有台标且文件存在: {$currentLogo}\n";
            continue;
        }
        
        // 更新 logo 字段 (只存储文件名)
        if (!$dryRun) {
            $conn->createQueryBuilder()
                ->update('channels')
                ->set('logo', ':logo')
                ->set('updated_at', ':updated_at')
                ->where('id = :id')
                ->setParameters([
                    'logo' => $logoFile,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'id' => $channelId,
                ])
                ->executeStatement();
        }
        
        $updated++;
        $action = $dryRun ? "[预览]" : "[更新]";
        $oldLogo = $currentLogo ?: '(无)';
        echo "{$action} {$channelName} [{$category}]\n";
        echo "  旧台标: {$oldLogo}\n";
        echo "  新台标: {$logoFile}\n";
    }
}

echo str_repeat('-', 80) . "\n";
echo "\n统计信息:\n";
echo "  匹配到台标: {$matched} 个\n";
echo "  需要更新: {$updated} 个\n";
echo "  已跳过: {$skipped} 个\n";
echo "  未匹配: " . (count($channels) - $matched) . " 个\n";

if ($dryRun) {
    echo "\n这是预览模式,数据库未被修改\n";
    echo "要实际更新数据库,请运行: php update_logos.php {$logoDir}\n";
} else {
    echo "\n数据库更新完成!\n";
}
