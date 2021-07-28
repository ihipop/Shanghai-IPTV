<?php

use Doctrine\DBAL;

require 'vendor/autoload.php';
include './common.inc.php';

$connectionParams = [
    'url' => $dbDSN,
];
$conn             = DBAL\DriverManager::getConnection($connectionParams);
$udpxy            = $argv[1] ?? null;
$queryBuilder     = $conn->createQueryBuilder();
$lists            = $queryBuilder->select('*')->from('iptv')->orderBy('sort', 'ASC')->fetchAllAssociative();
$data             = new \M3uParser\M3uData();
$data->setAttribute('name', '上海电信IPTV组播节目单');
foreach ($lists as $item) {
    $uri     = null;
    $quality = null;
    foreach (QUALITY_NAME_MAP as $Q => $q) {
        $key = 'uri_' . $q;
        if (!empty($item[$key])) {
            $uri     = $item[$key];
            $quality = '「' . $Q . '」';
            break;
        }
    }
    if (empty($uri) && !empty($item['uri'])) {
        $uri = $item['uri'];
    }
    if (empty($uri)) {
        continue;
    }
    if (!empty($udpxy)) {
        $uri = rtrim($udpxy, ' \t\n\r\0\x0B/') . '/' . str_replace('://', '/', $uri);
    }
    $title = $item['display_title'] ?? $item['name'];
    if ($quality) {
        $title .= $quality;
    }
    $entry = new M3uParser\M3uEntry();
    $entry->setPath($uri);
    $entry->addExtTag(
        (new M3uParser\Tag\ExtInf())
            ->setDuration(-1)
            ->setTitle($title)
            ->setAttributes([
                'tvg-id'      => $item['epg_id'],
                'tvg-name'    => $item['name'],
                'group-title' => $item['group'],
            ])
    );
    $data->append($entry);
}

echo $data;