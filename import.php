<?php

use Doctrine\DBAL;
use M3uParser\M3uParser;

require 'vendor/autoload.php';
include './common.inc.php';

$fileName         = $argv[1] ?? './tel_mu.m3u8';
$connectionParams = [
    'url' => $dbDSN,
];
$conn             = DBAL\DriverManager::getConnection($connectionParams);
$m3uParser        = new M3uParser();
$m3uParser->addDefaultTags();

$data              = $m3uParser->parseFile($fileName);
$resultsCollection = [];
$qualityMap        = QUALITY_NAME_MAP;
$lastSort          = 0;
/** @var \M3uParser\M3uEntry $entry */
foreach ($data as $key => $entry) {
    $arr  = [];
    $uris = explode(',', $entry->getPath());
    $uri  = array_shift($uris);
    if (empty($uris)) {
        $uris = null;
    }
    foreach ($entry->getExtTags() as $extTag) {
        switch ($extTag) {
            case $extTag instanceof \M3uParser\Tag\ExtInf: // If EXTINF tag
                $arr['display_title'] = $extTag->getTitle();
                $titleSeg             = explode('「', $arr['display_title']);
                if (isset($titleSeg[1])) {
                    $quality = trim(str_replace('」', '', $titleSeg[1]));
                    $key     = 'uri';
                    if (isset($qualityMap[$quality])) {
                        $key = 'uri_' . $qualityMap[$quality];
                    }
                    $arr[$key] = $uri;
                    if ($uris) {
                        $arr['backup_uris'] = [$key => $uris];
                    }
                }
                $arr['display_title'] = trim($titleSeg[0]);

                if ($extTag->hasAttribute('tvg-id')) {
                    $arr['epg_id'] = $extTag->getAttribute('tvg-id');
                    if (empty($arr['epg_id'])) {
                        $arr['epg_id'] = null;
                    }
                }
                if ($extTag->hasAttribute('tvg-name')) {
                    $arr['name'] = $extTag->getAttribute('tvg-name');
                }
                if ($extTag->hasAttribute('tvg-logo')) {
                    $arr['logo'] = $extTag->getAttribute('tvg-logo');
                }
                if ($extTag->hasAttribute('group-title')) {
                    $arr['group'] = $extTag->getAttribute('group-title');
                }
                break;
        }
    }
    if (empty($arr['name'])) {
        var_export($arr);
        die;
    }
    $sort = $resultsCollection[$arr['name']]['sort'] ?? null;
    if (!$sort) {
        $arr['sort'] = $lastSort += 10;
    } else {
        $arr['sort'] = $sort;
    }
    $arr['backup_uris']              = array_merge_recursive($arr['backup_uris'] ?? [], $resultsCollection[$arr['name']]['backup_uris'] ?? []);
    $resultsCollection[$arr['name']] = array_merge($arr, $resultsCollection[$arr['name']] ?? []);
}
$conn->beginTransaction();
//find exists record
$sql  = 'select * from iptv where name = :name';
$stmt = $conn->prepare($sql);
$stmt->bindValue("name", $arr['name']);
$result = $stmt->executeQuery()->fetchAllAssociative();
if (count($result) >= 1) {
    var_export($result);
    die();
} else {
    foreach ($resultsCollection as $arr) {
        $queryBuilder = $conn->createQueryBuilder();
        if (!empty($arr['backup_uris'])) {
            $arr['backup_uris'] = json_encode($arr['backup_uris']);
        } else {
            $arr['backup_uris'] = null;
        }
        if (empty($arr['created_at'])) {
            $arr['created_at'] = date('Y-m-d H:i:s');
        }
        $values = [];
        foreach ($arr as $k => $v) {
            $type = DBAL\ParameterType::STRING;
            if ($v === null) {
                $type = DBAL\ParameterType::NULL;
            }
            $values['`' . $k . '`'] = $queryBuilder->createNamedParameter($v, $type);
        }
        $queryBuilder->insert('iptv')->values($values)->executeStatement();
    }
}
$conn->commit();
