SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for iptv
-- ----------------------------
DROP TABLE IF EXISTS `iptv`;
CREATE TABLE `iptv`
(
    `id`            int(10) unsigned NOT NULL AUTO_INCREMENT,
    `sort`          int(255) DEFAULT NULL,
    `epg_id`        varchar(100) DEFAULT NULL,
    `name`          varchar(100) DEFAULT NULL,
    `logo`          varchar(255) DEFAULT NULL,
    `group`         varchar(255) DEFAULT NULL,
    `display_title` varchar(255) DEFAULT NULL,
    `4k_uri`        varchar(255) DEFAULT NULL,
    `hd_uri`        varchar(255) DEFAULT NULL,
    `sd_uri`        varchar(255) DEFAULT NULL,
    `ld_uri`        varchar(255) DEFAULT NULL,
    `uri`           varchar(255) DEFAULT NULL,
    `backup_uris`   json         DEFAULT NULL,
    `created_at`    timestamp NULL DEFAULT NULL,
    `updated_at`    timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of iptv
-- ----------------------------
BEGIN;
INSERT INTO `iptv`
VALUES (1, 10, 'cctv-1', 'CCTV-1(综合)', 'tv-logo/CCTV/HD/1HD.png', '央视频道', 'CCTV-1', NULL, 'rtp://239.45.3.145:5140', 'rtp://239.45.3.188:5140',
        'rtp://239.45.3.25:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (2, 20, 'cctv-2', 'CCTV-2(经济)', 'tv-logo/CCTV/HD/2.png', '央视频道', 'CCTV-2', NULL, 'rtp://239.45.0.1:5140', 'rtp://239.45.3.189:5140',
        'rtp://239.45.3.26:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (3, 30, 'cctv-3', 'CCTV-3(综艺)', 'tv-logo/CCTV/HD/3HD.png', '央视频道', 'CCTV-3', NULL, 'rtp://239.45.1.68:5140', 'rtp://239.45.1.75:5140', NULL, NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (4, 40, 'cctv-4', 'CCTV-4(国际)', 'tv-logo/CCTV/HD/4.png', '央视频道', 'CCTV-4', NULL, 'rtp://239.45.0.2:5140', 'rtp://239.45.3.190:5140',
        'rtp://239.45.3.28:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (5, 50, 'cctv-5', 'CCTV-5(体育)', 'tv-logo/CCTV/HD/5HD.png', '央视频道', 'CCTV-5', NULL, 'rtp://239.45.1.69:5140', 'rtp://239.45.1.73:5140',
        'rtp://239.45.3.254:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (6, 60, 'cctv-6', 'CCTV-6(电影)', 'tv-logo/CCTV/HD/6HD.png', '央视频道', 'CCTV-6', NULL, 'rtp://239.45.1.70:5140', NULL, NULL, NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (7, 70, 'cctv-7', 'CCTV-7(国防军事)', 'tv-logo/CCTV/HD/7.png', '央视频道', 'CCTV-7', NULL, 'rtp://239.45.3.56:5140', 'rtp://239.45.1.193:5140',
        'rtp://239.45.3.31:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (8, 80, 'cctv-8', 'CCTV-8(电视剧)', 'tv-logo/CCTV/HD/8HD.png', '央视频道', 'CCTV-8', NULL, 'rtp://239.45.1.71:5140', 'rtp://239.45.1.74:5140', NULL, NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (9, 90, 'cctv-9', 'CCTV-9(纪录)', 'tv-logo/CCTV/HD/9HD.png', '央视频道', 'CCTV-9', NULL, 'rtp://239.45.3.4:5140', NULL, NULL, NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (10, 100, 'cctv-10', 'CCTV-10(科技)', 'tv-logo/CCTV/HD/10.png', '央视频道', 'CCTV-10', NULL, 'rtp://239.45.3.8:5140', 'rtp://239.45.1.195:5140',
        'rtp://239.45.3.34:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (11, 110, 'cctv-11', 'CCTV-11(戏曲)', 'tv-logo/CCTV/SD/11.png', '央视频道', 'CCTV-11', NULL, NULL, 'rtp://239.45.1.196:5140', 'rtp://239.45.3.35:5140', NULL,
        NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (12, 120, 'cctv-12', 'CCTV-12(社会法制)', 'tv-logo/CCTV/HD/12.png', '央视频道', 'CCTV-12', NULL, 'rtp://239.45.3.10:5140', 'rtp://239.45.1.197:5140',
        'rtp://239.45.3.36:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (13, 130, 'cctv-13', 'CCTV-13(新闻)', 'tv-logo/CCTV/SD/13.png', '央视频道', 'CCTV-新闻', NULL, NULL, 'rtp://239.45.1.198:5140', 'rtp://239.45.3.37:5140', NULL,
        NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (14, 140, 'cctv-14', 'CCTV-14(少儿)', 'tv-logo/CCTV/HD/14.png', '央视频道', 'CCTV-少儿', NULL, 'rtp://239.45.3.23:5140', 'rtp://239.45.1.199:5140',
        'rtp://239.45.3.38:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (15, 150, 'cctv-15', 'CCTV-15(音乐)', 'tv-logo/CCTV/SD/15.png', '央视频道', 'CCTV-音乐', NULL, NULL, 'rtp://239.45.1.200:5140', 'rtp://239.45.3.39:5140', NULL,
        NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (16, 160, 'cctv-17', 'CCTV-17(农业农村)', 'tv-logo/CCTV/HD/17.png', '央视频道', 'CCTV-农业农村', NULL, 'rtp://239.45.3.52:5140', NULL, NULL, NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (17, 170, 'cctv-9', 'CGTN', 'tv-logo/CCTV/SD/9.png', '央视频道', 'CCTV-国际', NULL, NULL, 'rtp://239.45.1.194:5140', 'rtp://239.45.3.33:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (18, 180, 'dfws', '东方卫视', 'tv-logo/卫视/HD/东方HD.png', '上海文广', '东方卫视', NULL, 'rtp://239.45.3.146:5140', 'rtp://239.45.3.242:5140', 'rtp://239.45.3.21:5140',
        NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (19, 190, 'shanghaixinwen', '上海新闻', NULL, '上海文广', '新闻综合', NULL, 'rtp://239.45.3.209:5140', 'rtp://239.45.3.241:5140', 'rtp://239.45.3.11:5140', NULL,
        NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (20, 200, 'shanghaidushi', '上海都市', NULL, '上海文广', '上海都市', NULL, 'rtp://239.45.3.236:5140', 'rtp://239.45.3.243:5140', 'rtp://239.45.3.17:5140', NULL,
        NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (21, 210, 'wuxingtiyu', '五星体育', NULL, '上海文广', '五星体育', NULL, 'rtp://239.45.3.210:5140', 'rtp://239.45.3.15:5140', 'rtp://239.45.3.112:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (22, 220, 'shanghaidianshiju', '上海电视剧', NULL, '上海文广', '电视剧频道', NULL, 'rtp://239.45.3.237:5140', 'rtp://239.45.3.245:5140', 'rtp://239.45.3.14:5140',
        NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (23, 230, 'shenghuoshishang', '生活时尚', NULL, '上海文广', '生活时尚', NULL, 'rtp://239.45.3.132:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (24, 240, 'jishipindao', '上海纪实', NULL, '上海文广', '纪实频道-1', NULL, 'rtp://239.45.3.212:5140', 'rtp://239.45.3.247:5140', 'rtp://239.45.3.16:5140', NULL,
        NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (25, 250, NULL, '纪实人文', NULL, '上海文广', '纪实人文', NULL, 'rtp://239.45.3.212:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (26, 260, 'xdkt', '炫动卡通', NULL, '上海文广', '哈哈炫动卡通', NULL, 'rtp://239.45.1.55:5140', 'rtp://239.45.3.187:5140', 'rtp://239.45.3.24:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (27, 270, NULL, '上海教育', NULL, '上海文广', '上海教育', NULL, NULL, 'rtp://239.45.3.252:5140', 'rtp://239.45.3.122:5140', NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (28, 280, NULL, '足球频道', NULL, '专业频道', '足球频道', NULL, 'rtp://239.45.3.22:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (29, 290, 'diyicaijing', '第一财经', NULL, '上海文广', '第一财经', NULL, 'rtp://239.45.3.211:5140', 'rtp://239.45.3.13:5140', 'rtp://239.45.3.111:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (30, 300, 'dongfangcaijing', '东方财经', NULL, '上海文广', '东方财经-浦东', NULL, NULL, 'rtp://239.45.1.119:5140', 'rtp://239.45.3.192:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (31, 310, 'shanghaiwaiyu', '上海外语', NULL, '上海文广', '外语频道', NULL, 'rtp://239.45.1.127:5140', 'rtp://239.45.3.249:5140', 'rtp://239.45.3.20:5140', NULL,
        NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (32, 320, 'wenguangshuzidianshi-dushijuchang', '都市剧场', NULL, '上海文广', '都市剧场', NULL, 'rtp://239.45.3.136:5140', NULL, NULL, NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (33, 330, 'huanxiaojuchanghd', '欢笑剧场', NULL, '上海文广', '欢笑剧场', NULL, 'rtp://239.45.3.196:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (34, 340, NULL, '嘉定电视', NULL, '上海文广', '嘉定电视', NULL, NULL, NULL, 'rtp://239.45.3.185:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (35, 350, NULL, '浦东电视', NULL, '上海文广', '浦东电视', NULL, NULL, 'rtp://239.45.3.248:5140', NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (36, 360, NULL, '崇明电视', NULL, '上海文广', '崇明电视', NULL, NULL, 'rtp://239.45.1.54:5140', NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (37, 370, NULL, '健康人生', NULL, '上海文广', '健康人生', NULL, NULL, NULL, 'rtp://239.45.3.214:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (38, 380, 'cetv1', '中国教育台', NULL, '专业频道', '中国教育1台', NULL, 'rtp://239.45.1.125:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (39, 390, 'jisuqichehd', '极速汽车', NULL, '专业频道', '极速汽车', NULL, 'rtp://239.45.3.49:5140', NULL, 'rtp://239.45.1.211:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (40, 400, NULL, 'PP体育', NULL, '专业频道', 'PP体育', NULL, 'rtp://239.45.3.164:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (41, 410, 'quanjishihd', '全纪实', NULL, '专业频道', '全纪实', NULL, 'rtp://239.45.3.135:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (42, 420, 'youxifengyunhd', '游戏风云', NULL, '专业频道', '游戏风云', NULL, 'rtp://239.45.3.131:5140', 'rtp://239.45.3.64:5140', NULL, NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (43, 430, 'cctvpayfee-fztd', '法治天地', NULL, '专业频道', '法治天地', NULL, 'rtp://239.45.1.46:5140', 'rtp://239.45.1.192:5140', 'rtp://239.45.3.60:5140', NULL,
        NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (44, 440, 'cctvpayfee-qcxj', '七彩戏剧', NULL, '专业频道', '七彩戏剧', NULL, NULL, 'rtp://239.45.1.112:5140', 'rtp://239.45.3.61:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (45, 450, 'ccctvpayfee-jspd', '金色频道', NULL, '专业频道', '金色频道', NULL, NULL, 'rtp://239.45.1.118:5140', 'rtp://239.45.3.51:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (46, 460, 'dongmanxiuchanghd', '动漫秀场', NULL, '专业频道', '动漫秀场', NULL, 'rtp://239.45.3.134:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (47, 470, NULL, 'BTV-KAKU少儿', NULL, '专业频道', 'BTV-KAKU少儿', NULL, 'rtp://239.45.0.8:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (48, 480, 'hunandianshitai-hnws', '湖南卫视', NULL, '各省卫视', '湖南卫视', NULL, 'rtp://239.45.3.228:5140', 'rtp://239.45.1.215:5140', 'rtp://239.45.3.45:5140',
        NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (49, 490, 'jiangsudianshitai-jsws', '江苏卫视', NULL, '各省卫视', '江苏卫视', NULL, 'rtp://239.45.3.177:5140', 'rtp://239.45.1.216:5140', 'rtp://239.45.3.40:5140',
        NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (50, 500, 'zhejiangdianshitai-zjws', '浙江卫视', NULL, '各省卫视', '浙江卫视', NULL, 'rtp://239.45.3.178:5140', 'rtp://239.45.1.217:5140', 'rtp://239.45.3.41:5140',
        NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (51, 510, 'gzws', '贵州卫视', NULL, '各省卫视', '贵州卫视', NULL, 'rtp://239.45.1.80:5140', 'rtp://239.45.1.241:5140', 'rtp://239.45.3.224:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (52, 520, NULL, '海南卫视', NULL, '各省卫视', '海南卫视', NULL, 'rtp://239.45.1.81:5140', 'rtp://239.45.1.218:5140', NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (53, 530, 'ahws', '安徽卫视', NULL, '各省卫视', '安徽卫视', NULL, 'rtp://239.45.1.120:5140', 'rtp://239.45.1.223:5140', 'rtp://239.45.3.43:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (54, 540, 'dnws', '东南卫视', NULL, '各省卫视', '东南卫视', NULL, 'rtp://239.45.1.121:5140', 'rtp://239.45.1.224:5140', 'rtp://239.45.3.227:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (55, 550, 'liaoningdianshitai-lnws', '辽宁卫视', NULL, '各省卫视', '辽宁卫视', NULL, 'rtp://239.45.1.123:5140', 'rtp://239.45.1.222:5140', 'rtp://239.45.3.43:5140',
        NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (56, 560, 'tianjindianshitai-tjws', '天津卫视', NULL, '各省卫视', '天津卫视', NULL, 'rtp://239.45.1.124:5140', 'rtp://239.45.1.226:5140', 'rtp://239.45.3.168:5140',
        NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (57, 570, 'scws', '四川卫视', NULL, '各省卫视', '四川卫视', NULL, 'rtp://239.45.1.83:5140', 'rtp://239.45.1.220:5140', 'rtp://239.45.3.48:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (58, 580, 'BTV-1', '北京卫视', NULL, '各省卫视', '北京卫视', NULL, 'rtp://239.45.3.229:5140', 'rtp://239.45.1.214:5140', 'rtp://239.45.3.109:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (59, 590, 'gdws', '广东卫视', NULL, '各省卫视', '广东卫视', NULL, 'rtp://239.45.3.230:5140', 'rtp://239.45.1.235:5140', 'rtp://239.45.3.65:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (60, 600, 'cqws', '重庆卫视', NULL, '各省卫视', '重庆卫视', NULL, 'rtp://239.45.1.84:5140', 'rtp://239.45.1.240:5140', 'rtp://239.45.3.223:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (61, 610, 'jxws', '江西卫视', NULL, '各省卫视', '江西卫视', NULL, 'rtp://239.45.1.122:5140', 'rtp://239.45.1.227:5140', 'rtp://239.45.3.169:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (62, 620, 'szws', '深圳卫视', NULL, '各省卫视', '深圳卫视', NULL, 'rtp://239.45.3.231:5140', 'rtp://239.45.1.115:5140', 'rtp://239.45.3.141:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (63, 630, 'hljws', '黑龙江卫视', NULL, '各省卫视', '黑龙江卫视', NULL, 'rtp://239.45.3.232:5140', 'rtp://239.45.1.236:5140', 'rtp://239.45.3.220:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (64, 640, 'sdws', '山东卫视', NULL, '各省卫视', '山东卫视', NULL, 'rtp://239.45.3.238:5140', 'rtp://239.45.1.221:5140', 'rtp://239.45.3.44:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (65, 650, 'hubeidianshitai-hbws', '湖北卫视', NULL, '各省卫视', '湖北卫视', NULL, 'rtp://239.45.3.239:5140', 'rtp://239.45.1.239:5140', 'rtp://239.45.3.222:5140',
        NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (66, 660, 'sstv-sanshatv', '三沙卫视', NULL, '各省卫视', '三沙卫视', NULL, NULL, 'rtp://239.45.1.82:5140', NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (67, 670, 'xjtv-xjtv1', '新疆卫视', NULL, '各省卫视', '新疆卫视', NULL, NULL, 'rtp://239.45.1.116:5140', 'rtp://239.45.3.142:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (68, 680, 'bingtuan-bingtuan', '兵团卫视', NULL, '各省卫视', '兵团卫视', NULL, NULL, 'rtp://239.45.1.117:5140', 'rtp://239.45.3.143:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (69, 690, 'ningxia', '宁夏卫视', NULL, '各省卫视', '宁夏卫视', NULL, NULL, 'rtp://239.45.1.213:5140', 'rtp://239.45.3.176:5140', NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (70, 700, 'guangxi', '广西卫视', NULL, '各省卫视', '广西卫视', NULL, 'rtp://239.45.0.5:5140', 'rtp://239.45.1.219:5140', 'rtp://239.45.3.46:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (71, 710, 'jlws', '吉林卫视', NULL, '各省卫视', '吉林卫视', NULL, 'rtp://239.45.0.6:5140', 'rtp://239.45.1.228:5140', 'rtp://239.45.3.170:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (72, 720, 'shan1xi', '山西卫视', NULL, '各省卫视', '山西卫视', NULL, NULL, 'rtp://239.45.1.229:5140', 'rtp://239.45.3.171:5140', NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (73, 730, 'qinghai', '青海卫视', NULL, '各省卫视', '青海卫视', NULL, NULL, 'rtp://239.45.1.230:5140', 'rtp://239.45.3.172:5140', NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (74, 740, 'satellite-xizangtv1', '西藏卫视', NULL, '各省卫视', '西藏卫视', NULL, NULL, 'rtp://239.45.1.231:5140', 'rtp://239.45.3.173:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (75, 750, 'shan3xi', '陕西卫视', NULL, '各省卫视', '陕西卫视', NULL, NULL, 'rtp://239.45.1.232:5140', 'rtp://239.45.3.174:5140', NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (76, 760, 'yunnan', '云南卫视', NULL, '各省卫视', '云南卫视', NULL, 'rtp://239.45.0.4:5140', 'rtp://239.45.1.233:5140', 'rtp://239.45.3.180:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (77, 770, 'gansu', '甘肃卫视', NULL, '各省卫视', '甘肃卫视', NULL, NULL, 'rtp://239.45.1.234:5140', 'rtp://239.45.3.175:5140', NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (78, 780, 'hebeidianshitai-hbws', '河北卫视', NULL, '各省卫视', '河北卫视', NULL, 'rtp://239.45.1.44:5140', 'rtp://239.45.1.237:5140', 'rtp://239.45.3.226:5140',
        NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (79, 790, 'neimenggu', '内蒙古卫视', NULL, '各省卫视', '内蒙古卫视', NULL, NULL, 'rtp://239.45.1.238:5140', 'rtp://239.45.3.221:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (80, 800, 'henan', '河南卫视', NULL, '各省卫视', '河南卫视', NULL, 'rtp://239.45.0.3:5140', 'rtp://239.45.1.242:5140', 'rtp://239.45.3.225:5140', NULL, NULL,
        '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (81, 810, 'KBWS', '康巴卫视', NULL, '各省卫视', '康巴卫视', NULL, NULL, 'rtp://239.45.1.251:5140', NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (82, 820, 'jykt', '金鹰纪实', NULL, '专业频道', '金鹰纪实', NULL, 'rtp://239.45.1.45:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (83, 830, 'jykt', '金鹰卡通', NULL, '专业频道', '金鹰卡通', NULL, NULL, 'rtp://239.45.3.119:5140', 'rtp://239.45.3.118:5140', NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (84, 840, 'cctvpayfee-kuailechuidiao', '湖南快乐垂钓', NULL, '专业频道', '湖南快乐垂钓', NULL, 'rtp://239.45.3.12:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (85, 850, 'jilu', '湖南茶频道', NULL, '专业频道', '湖南茶频道', NULL, 'rtp://239.45.3.18:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (86, 860, NULL, '江西陶瓷频道', NULL, '专业频道', '江西陶瓷频道', NULL, 'rtp://239.45.3.50:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (87, 870, NULL, '百事通电影', NULL, '百事通', '百事通电影', 'rtp://239.45.3.107:5140', NULL, NULL, NULL, NULL, '{
    \"4k_uri\": [\"rtp://239.45.1.42:5140\"]}', '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (88, 880, NULL, '百事通电影-2', NULL, '百事通', '百事通电影-2', 'rtp://239.45.1.9:5140', NULL, NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (89, 890, NULL, '百事通纪实', NULL, '百事通', '百事通纪实', 'rtp://239.45.1.10:5140', NULL, 'rtp://239.45.1.103:5140', NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (90, 900, NULL, '百事通动画', NULL, '百事通', '百事通动画', 'rtp://239.45.1.11:5140', NULL, NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv`
VALUES (91, 910, 'huanxiaojuchanghd', '4K测试', NULL, '上海文广', '欢笑剧场', 'rtp://239.45.1.4:5140', NULL, NULL, NULL, NULL, NULL, '2021-07-28 03:07:01',
        '2021-07-28 11:07:01');
COMMIT;

SET
FOREIGN_KEY_CHECKS = 1;
