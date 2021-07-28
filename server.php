<?php
/**
 * @author ihipop@gmail.com @ 2021/7/28 下午1:55 For Shanghai-IPTV.
 */

define('SERVER_MODE', true);
$argv[1] = $_SERVER['QUERY_STRING'] ?? '';
$args    = [];
parse_str($argv[1], $args);
$udpxy    = $args['udpxy'] ?? null;
$fileName = $args['file'] ?? 'tel_mu';
$fileName = basename($fileName) . '.m3u8';
$m3u8     = null;
if (!file_exists($fileName)) {
    $m3u8 = include './export.php';
    if (empty($udpxy)) {
        file_put_contents($fileName, $m3u8);
    }
}
if (empty($udpxy)) {
    header('Location: ' . $fileName);
    exit();
}
if (empty($m3u8)) {
    $m3u8 = file_get_contents($fileName);
}

header('Content-type:application/vnd.apple.mpegurl; charset=utf-8');
header('Content-Disposition: attachment; filename="' . $fileName . '"');
echo str_replace('rtp://', rtrim($udpxy, ' \t\n\r\0\x0B/') . '/rtp/', $m3u8);
