<?php
/**
 * @author ihipop@gmail.com @ 2021/7/28 上午11:59 For Shanghai-IPTV.
 */
const QUALITY_NAME_MAP = [
    '4K' => '4k',
    '高清' => 'hd',
    '标清' => 'sd',
    '普清' => 'ld',
];
$dbDSN = getenv('IPTV_DB_DSN', true) ?: 'sqlite:///iptv.sqlite';
//eg: pdo-mysql://root:123456@127.0.0.1:3306/example?charset=UTF8
if (!defined('SERVER_MODE')) {
    define('SERVER_MODE', false);
}
