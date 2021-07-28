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
if (!file_exists($fileName)) {
    $m3u8 = include './export.php';
    file_put_contents($fileName, $m3u8);
}
if (empty($udpxy)) {
    header('Location: ' . $fileName);
    exit();
}
$m3u8 = file_get_contents($fileName);

header('Content-type:application/x-mpegURL; charset=utf-8');
header('Content-Disposition: attachment; filename="' . $fileName . '"');
echo str_replace('rtp://', rtrim($udpxy, ' \t\n\r\0\x0B/') . '/rtp/', $m3u8);
