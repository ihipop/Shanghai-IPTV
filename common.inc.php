<?php
/**
 * @author ihipop@gmail.com @ 2021/7/28 上午11:59 For Shanghai-IPTV.
 */
// 清晰度名称映射 (用于识别TXT文件中的清晰度标识)
const QUALITY_NAME_MAP = [
    '4K' => '4k',
    '高清' => 'hd',
    '标清' => 'sd',
    '普清' => 'ld',
];

// 清晰度标准化映射 (数据库存储使用)
// 导入时会使用大小写不敏感的比较
const QUALITY_MAP = [
    '4K' => '4K',
    'HD' => 'HD',
    '高清' => 'HD',
    'SD' => 'SD',
    '标清' => 'SD',
    'LD' => 'LD',
    '普清' => 'LD',
];

// M3U8 导出时显示清晰度标签的配置
// 只有 4K 和 HD 会在频道名后显示「4K」「高清」标识
const QUALITY_DISPLAY_MAP = [
    '4K' => '「4K」',
    'HD' => '「高清」',
    'SD' => '',      // 不显示
    'LD' => '',      // 不显示
];

// EPG 源配置
const EPG_SOURCES = [
    'rytec' => 'Rytec EPG',
    'sparks' => 'Sparks EPG',
    'epg.pw' => 'EPG.pw',
];

$dbDSN = getenv('IPTV_DB_DSN', true) ?: 'sqlite:///iptv.sqlite';
//eg: pdo-mysql://root:123456@127.0.0.1:3306/example?charset=UTF8
if (!defined('SERVER_MODE')) {
    define('SERVER_MODE', false);
}

/**
 * 输出日志信息到 STDERR
 * @param string $message 日志消息
 */
function log_message($message) {
    fwrite(STDERR, $message);
}
