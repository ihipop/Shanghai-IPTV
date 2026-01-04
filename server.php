<?php
/**
 * @author ihipop@gmail.com @ 2021/7/28 下午1:55 For Shanghai-IPTV.
 */

define('SERVER_MODE', true);
$argv[1] = $_SERVER['QUERY_STRING'] ?? '';
$args    = [];
parse_str($argv[1], $args);
$fileName = $args['file'] ?? 'tel_mu';
$fileName = basename($fileName) . '.m3u8';

// 每次都从数据库导出,确保数据是最新的
$m3u8 = include './export.php';


header('Content-Type: application/vnd.apple.mpegurl; charset=utf-8');
header('Content-Disposition: attachment; filename*=UTF-8\'\'' . rawurlencode($fileName));
echo $m3u8;
