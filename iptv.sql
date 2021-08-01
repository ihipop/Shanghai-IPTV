/*
 Navicat Premium Data Transfer

 Source Server         : LocalHost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 127.0.0.1:3306
 Source Schema         : yyets

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 01/08/2021 15:46:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for iptv
-- ----------------------------
DROP TABLE IF EXISTS `iptv`;
CREATE TABLE `iptv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(255) DEFAULT NULL,
  `rytec_epg_id` varchar(100) DEFAULT NULL,
  `51zmt_epg_id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `display_title` varchar(255) DEFAULT NULL,
  `uri_4k` varchar(255) DEFAULT NULL,
  `uri_hd` varchar(255) DEFAULT NULL,
  `uri_sd` varchar(255) DEFAULT NULL,
  `uri_ld` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `backup_uris` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of iptv
-- ----------------------------
BEGIN;
INSERT INTO `iptv` VALUES (1, 10, 'cctv-1', NULL, 'CCTV-1(综合)', 'tv-logo/CCTV/HD/1HD.png', '央视频道', 'CCTV-综合', NULL, 'rtp://239.45.3.145:5140', 'rtp://239.45.3.188:5140', 'rtp://239.45.3.25:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:38:55');
INSERT INTO `iptv` VALUES (2, 20, 'cctv-2', NULL, 'CCTV-2(经济)', 'tv-logo/CCTV/HD/2.png', '央视频道', 'CCTV-经济', NULL, 'rtp://239.45.0.1:5140', 'rtp://239.45.3.189:5140', 'rtp://239.45.3.26:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:38:59');
INSERT INTO `iptv` VALUES (3, 30, 'cctv-3', NULL, 'CCTV-3(综艺)', 'tv-logo/CCTV/HD/3HD.png', '央视频道', 'CCTV-综艺', NULL, 'rtp://239.45.1.68:5140', 'rtp://239.45.1.75:5140', NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:39:05');
INSERT INTO `iptv` VALUES (4, 40, 'cctv-4', NULL, 'CCTV-4(国际)', 'tv-logo/CCTV/HD/4.png', '央视频道', 'CCTV-国际', NULL, 'rtp://239.45.0.2:5140', 'rtp://239.45.3.190:5140', 'rtp://239.45.3.28:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:39:40');
INSERT INTO `iptv` VALUES (5, 50, 'cctv-5', NULL, 'CCTV-5(体育)', 'tv-logo/CCTV/HD/5HD.png', '央视频道', 'CCTV-体育', NULL, 'rtp://239.45.1.69:5140', 'rtp://239.45.1.73:5140', 'rtp://239.45.3.254:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:39:43');
INSERT INTO `iptv` VALUES (6, 60, 'cctv-6', NULL, 'CCTV-6(电影)', 'tv-logo/CCTV/HD/6HD.png', '央视频道', 'CCTV-电影', NULL, 'rtp://239.45.1.70:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:39:56');
INSERT INTO `iptv` VALUES (7, 70, 'cctv-7', NULL, 'CCTV-7(国防军事)', 'tv-logo/CCTV/HD/7.png', '央视频道', 'CCTV-国防军事', NULL, 'rtp://239.45.3.56:5140', 'rtp://239.45.1.193:5140', 'rtp://239.45.3.31:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:39:58');
INSERT INTO `iptv` VALUES (8, 80, 'cctv-8', NULL, 'CCTV-8(电视剧)', 'tv-logo/CCTV/HD/8HD.png', '央视频道', 'CCTV-电视剧', NULL, 'rtp://239.45.1.71:5140', 'rtp://239.45.1.74:5140', NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:40:01');
INSERT INTO `iptv` VALUES (9, 90, 'cctv-9', NULL, 'CCTV-9(纪录)', 'tv-logo/CCTV/HD/9HD.png', '央视频道', 'CCTV-记录', NULL, 'rtp://239.45.3.4:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:40:08');
INSERT INTO `iptv` VALUES (10, 100, 'cctv-10', NULL, 'CCTV-10(科技)', 'tv-logo/CCTV/HD/10.png', '央视频道', 'CCTV-科技', NULL, 'rtp://239.45.3.8:5140', 'rtp://239.45.1.195:5140', 'rtp://239.45.3.34:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:40:12');
INSERT INTO `iptv` VALUES (11, 110, 'cctv-11', NULL, 'CCTV-11(戏曲)', 'tv-logo/CCTV/SD/11.png', '央视频道', 'CCTV-戏曲', NULL, NULL, 'rtp://239.45.1.196:5140', 'rtp://239.45.3.35:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:40:15');
INSERT INTO `iptv` VALUES (12, 120, 'cctv-12', NULL, 'CCTV-12(社会法制)', 'tv-logo/CCTV/HD/12.png', '央视频道', 'CCTV-社会法治', NULL, 'rtp://239.45.3.10:5140', 'rtp://239.45.1.197:5140', 'rtp://239.45.3.36:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 12:40:19');
INSERT INTO `iptv` VALUES (13, 130, 'cctv-13', NULL, 'CCTV-13(新闻)', 'tv-logo/CCTV/SD/13.png', '央视频道', 'CCTV-新闻', NULL, NULL, 'rtp://239.45.1.198:5140', 'rtp://239.45.3.37:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (14, 140, 'cctv-14', NULL, 'CCTV-14(少儿)', 'tv-logo/CCTV/HD/14.png', '央视频道', 'CCTV-少儿', NULL, 'rtp://239.45.3.23:5140', 'rtp://239.45.1.199:5140', 'rtp://239.45.3.38:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (15, 150, 'cctv-15', NULL, 'CCTV-15(音乐)', 'tv-logo/CCTV/SD/15.png', '央视频道', 'CCTV-音乐', NULL, NULL, 'rtp://239.45.1.200:5140', 'rtp://239.45.3.39:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (16, 160, 'cctv-17', NULL, 'CCTV-17(农业农村)', 'tv-logo/CCTV/HD/17.png', '央视频道', 'CCTV-农业农村', NULL, 'rtp://239.45.3.52:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (17, 170, 'cctv9', NULL, 'CGTN', 'tv-logo/CCTV/SD/9.png', '央视频道', 'CGTN', NULL, NULL, 'rtp://239.45.1.194:5140', 'rtp://239.45.3.33:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-30 18:19:32');
INSERT INTO `iptv` VALUES (18, 180, 'dfws', NULL, '东方卫视', 'tv-logo/卫视/HD/东方HD.png', '上海文广', '东方卫视', NULL, 'rtp://239.45.3.146:5140', 'rtp://239.45.3.242:5140', 'rtp://239.45.3.21:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (19, 190, 'shanghaixinwen', NULL, '上海新闻', NULL, '上海文广', '新闻综合', NULL, 'rtp://239.45.3.209:5140', 'rtp://239.45.3.241:5140', 'rtp://239.45.3.11:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (20, 200, 'shanghaidushi', NULL, '上海都市', NULL, '上海文广', '上海都市', NULL, 'rtp://239.45.3.236:5140', 'rtp://239.45.3.243:5140', 'rtp://239.45.3.17:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (21, 210, 'wuxingtiyu', NULL, '五星体育', NULL, '上海文广', '五星体育', NULL, 'rtp://239.45.3.210:5140', 'rtp://239.45.3.15:5140', 'rtp://239.45.3.112:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (22, 220, 'shanghaidianshiju', NULL, '上海电视剧', NULL, '上海文广', '电视剧频道', NULL, 'rtp://239.45.3.237:5140', 'rtp://239.45.3.245:5140', 'rtp://239.45.3.14:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (23, 230, 'shenghuoshishang', NULL, '生活时尚', NULL, '上海文广', '生活时尚', NULL, 'rtp://239.45.3.132:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (24, 240, 'jishipindao', NULL, '上海纪实', NULL, '上海文广', '上海纪实', NULL, 'rtp://239.45.3.212:5140', 'rtp://239.45.3.247:5140', 'rtp://239.45.3.16:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-30 18:21:22');
INSERT INTO `iptv` VALUES (25, 250, NULL, NULL, '纪实人文', NULL, '上海文广', '纪实人文', NULL, 'rtp://239.45.3.212:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (26, 260, 'xdkt', NULL, '炫动卡通', NULL, '上海文广', '哈哈炫动卡通', NULL, 'rtp://239.45.1.55:5140', 'rtp://239.45.3.187:5140', 'rtp://239.45.3.24:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (27, 270, NULL, NULL, '上海教育', NULL, '上海文广', '上海教育', NULL, NULL, 'rtp://239.45.3.252:5140', 'rtp://239.45.3.122:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (28, 280, 'zqhd', NULL, '足球频道', NULL, '专业频道', '足球频道', NULL, 'rtp://239.45.3.22:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-30 18:23:41');
INSERT INTO `iptv` VALUES (29, 290, 'diyicaijing', NULL, '第一财经', NULL, '上海文广', '第一财经', NULL, 'rtp://239.45.3.211:5140', 'rtp://239.45.3.13:5140', 'rtp://239.45.3.111:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (30, 300, 'dongfangcaijing', NULL, '东方财经', NULL, '上海文广', '东方财经-浦东', NULL, NULL, 'rtp://239.45.1.119:5140', 'rtp://239.45.3.192:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (31, 310, 'shanghaiwaiyu', NULL, '上海外语', NULL, '上海文广', '外语频道', NULL, 'rtp://239.45.1.127:5140', 'rtp://239.45.3.249:5140', 'rtp://239.45.3.20:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (32, 320, 'wenguangshuzidianshi-dushijuchang', NULL, '都市剧场', NULL, '上海文广', '都市剧场', NULL, 'rtp://239.45.3.136:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (33, 330, 'huanxiaojuchanghd', NULL, '欢笑剧场', NULL, '上海文广', '欢笑剧场', 'rtp://239.45.1.4:5140', 'rtp://239.45.3.196:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-30 18:10:15');
INSERT INTO `iptv` VALUES (34, 340, NULL, NULL, '嘉定电视', NULL, '上海文广', '嘉定电视', NULL, NULL, NULL, 'rtp://239.45.3.185:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (35, 350, NULL, NULL, '浦东电视', NULL, '上海文广', '浦东电视', NULL, NULL, 'rtp://239.45.3.248:5140', NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (36, 360, NULL, NULL, '崇明电视', NULL, '上海文广', '崇明电视', NULL, 'rtp://239.45.1.54:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-30 18:11:06');
INSERT INTO `iptv` VALUES (37, 370, NULL, NULL, '健康人生', NULL, '上海文广', '健康人生', NULL, NULL, NULL, 'rtp://239.45.3.214:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (38, 380, 'cetv1', NULL, '中国教育台', NULL, '专业频道', '中国教育1台', NULL, 'rtp://239.45.1.125:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (39, 390, 'jisuqichehd', NULL, '极速汽车', NULL, '专业频道', '极速汽车', NULL, 'rtp://239.45.3.49:5140', NULL, 'rtp://239.45.1.211:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (41, 410, 'quanjishihd', NULL, '全纪实', NULL, '专业频道', '全纪实', NULL, 'rtp://239.45.3.135:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (42, 420, 'youxifengyunhd', NULL, '游戏风云', NULL, '专业频道', '游戏风云', NULL, 'rtp://239.45.3.131:5140', 'rtp://239.45.3.64:5140', NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (43, 430, 'cctvpayfee-fztd', NULL, '法治天地', NULL, '专业频道', '法治天地', NULL, 'rtp://239.45.1.46:5140', 'rtp://239.45.1.192:5140', 'rtp://239.45.3.60:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (44, 440, 'cctvpayfee-qcxj', NULL, '七彩戏剧', NULL, '专业频道', '七彩戏剧', NULL, NULL, 'rtp://239.45.1.112:5140', 'rtp://239.45.3.61:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (45, 450, 'ccctvpayfee-jspd', NULL, '金色频道', NULL, '专业频道', '金色频道', NULL, NULL, 'rtp://239.45.1.118:5140', 'rtp://239.45.3.51:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (46, 460, 'dongmanxiuchanghd', NULL, '动漫秀场', NULL, '专业频道', '动漫秀场', NULL, 'rtp://239.45.3.134:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (47, 470, 'btvchild', NULL, 'BTV卡酷少儿', NULL, '专业频道', '卡酷少儿', NULL, 'rtp://239.45.0.8:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-30 18:26:09');
INSERT INTO `iptv` VALUES (48, 480, 'hunandianshitai-hnws', NULL, '湖南卫视', NULL, '各省卫视', '湖南卫视', NULL, 'rtp://239.45.3.228:5140', 'rtp://239.45.1.215:5140', 'rtp://239.45.3.45:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (49, 490, 'jiangsudianshitai-jsws', NULL, '江苏卫视', NULL, '各省卫视', '江苏卫视', NULL, 'rtp://239.45.3.177:5140', 'rtp://239.45.1.216:5140', 'rtp://239.45.3.40:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (50, 500, 'zhejiangdianshitai-zjws', NULL, '浙江卫视', NULL, '各省卫视', '浙江卫视', NULL, 'rtp://239.45.3.178:5140', 'rtp://239.45.1.217:5140', 'rtp://239.45.3.41:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (51, 510, 'gzws', NULL, '贵州卫视', NULL, '各省卫视', '贵州卫视', NULL, 'rtp://239.45.1.80:5140', 'rtp://239.45.1.241:5140', 'rtp://239.45.3.224:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (52, 520, NULL, NULL, '海南卫视', NULL, '各省卫视', '海南卫视', NULL, 'rtp://239.45.1.81:5140', 'rtp://239.45.1.218:5140', NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (53, 530, 'ahws', NULL, '安徽卫视', NULL, '各省卫视', '安徽卫视', NULL, 'rtp://239.45.1.120:5140', 'rtp://239.45.1.223:5140', 'rtp://239.45.3.43:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (54, 540, 'dnws', NULL, '东南卫视', NULL, '各省卫视', '东南卫视', NULL, 'rtp://239.45.1.121:5140', 'rtp://239.45.1.224:5140', 'rtp://239.45.3.227:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (55, 550, 'liaoningdianshitai-lnws', NULL, '辽宁卫视', NULL, '各省卫视', '辽宁卫视', NULL, 'rtp://239.45.1.123:5140', 'rtp://239.45.1.222:5140', 'rtp://239.45.3.43:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (56, 560, 'tianjindianshitai-tjws', NULL, '天津卫视', NULL, '各省卫视', '天津卫视', NULL, 'rtp://239.45.1.124:5140', 'rtp://239.45.1.226:5140', 'rtp://239.45.3.168:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (57, 570, 'scws', NULL, '四川卫视', NULL, '各省卫视', '四川卫视', NULL, 'rtp://239.45.1.83:5140', 'rtp://239.45.1.220:5140', 'rtp://239.45.3.48:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (58, 580, 'BTV-1', NULL, '北京卫视', NULL, '各省卫视', '北京卫视', NULL, 'rtp://239.45.3.229:5140', 'rtp://239.45.1.214:5140', 'rtp://239.45.3.109:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (59, 590, 'gdws', NULL, '广东卫视', NULL, '各省卫视', '广东卫视', NULL, 'rtp://239.45.3.230:5140', 'rtp://239.45.1.235:5140', 'rtp://239.45.3.65:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (60, 600, 'cqws', NULL, '重庆卫视', NULL, '各省卫视', '重庆卫视', NULL, 'rtp://239.45.1.84:5140', 'rtp://239.45.1.240:5140', 'rtp://239.45.3.223:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (61, 610, 'jxws', NULL, '江西卫视', NULL, '各省卫视', '江西卫视', NULL, 'rtp://239.45.1.122:5140', 'rtp://239.45.1.227:5140', 'rtp://239.45.3.169:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (62, 620, 'szws', NULL, '深圳卫视', NULL, '各省卫视', '深圳卫视', NULL, 'rtp://239.45.3.231:5140', 'rtp://239.45.1.115:5140', 'rtp://239.45.3.141:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (63, 630, 'hljws', NULL, '黑龙江卫视', NULL, '各省卫视', '黑龙江卫视', NULL, 'rtp://239.45.3.232:5140', 'rtp://239.45.1.236:5140', 'rtp://239.45.3.220:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (64, 640, 'sdws', NULL, '山东卫视', NULL, '各省卫视', '山东卫视', NULL, 'rtp://239.45.3.238:5140', 'rtp://239.45.1.221:5140', 'rtp://239.45.3.44:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (65, 650, 'hubeidianshitai-hbws', NULL, '湖北卫视', NULL, '各省卫视', '湖北卫视', NULL, 'rtp://239.45.3.239:5140', 'rtp://239.45.1.239:5140', 'rtp://239.45.3.222:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (66, 660, 'sstv-sanshatv', NULL, '三沙卫视', NULL, '各省卫视', '三沙卫视', NULL, NULL, 'rtp://239.45.1.82:5140', NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (67, 670, 'xjtv-xjtv1', NULL, '新疆卫视', NULL, '各省卫视', '新疆卫视', NULL, NULL, 'rtp://239.45.1.116:5140', 'rtp://239.45.3.142:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (68, 680, 'bingtuan-bingtuan', NULL, '兵团卫视', NULL, '各省卫视', '兵团卫视', NULL, NULL, 'rtp://239.45.1.117:5140', 'rtp://239.45.3.143:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (69, 690, 'ningxia', NULL, '宁夏卫视', NULL, '各省卫视', '宁夏卫视', NULL, NULL, 'rtp://239.45.1.213:5140', 'rtp://239.45.3.176:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (70, 700, 'guangxi', NULL, '广西卫视', NULL, '各省卫视', '广西卫视', NULL, 'rtp://239.45.0.5:5140', 'rtp://239.45.1.219:5140', 'rtp://239.45.3.46:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (71, 710, 'jlws', NULL, '吉林卫视', NULL, '各省卫视', '吉林卫视', NULL, 'rtp://239.45.0.6:5140', 'rtp://239.45.1.228:5140', 'rtp://239.45.3.170:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (72, 720, 'shan1xi', NULL, '山西卫视', NULL, '各省卫视', '山西卫视', NULL, NULL, 'rtp://239.45.1.229:5140', 'rtp://239.45.3.171:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (73, 730, 'qinghai', NULL, '青海卫视', NULL, '各省卫视', '青海卫视', NULL, NULL, 'rtp://239.45.1.230:5140', 'rtp://239.45.3.172:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (74, 740, 'satellite-xizangtv1', NULL, '西藏卫视', NULL, '各省卫视', '西藏卫视', NULL, NULL, 'rtp://239.45.1.231:5140', 'rtp://239.45.3.173:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (75, 750, 'shan3xi', NULL, '陕西卫视', NULL, '各省卫视', '陕西卫视', NULL, NULL, 'rtp://239.45.1.232:5140', 'rtp://239.45.3.174:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (76, 760, 'yunnan', NULL, '云南卫视', NULL, '各省卫视', '云南卫视', NULL, 'rtp://239.45.0.4:5140', 'rtp://239.45.1.233:5140', 'rtp://239.45.3.180:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (77, 770, 'gansu', NULL, '甘肃卫视', NULL, '各省卫视', '甘肃卫视', NULL, NULL, 'rtp://239.45.1.234:5140', 'rtp://239.45.3.175:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (78, 780, 'hebeidianshitai-hbws', NULL, '河北卫视', NULL, '各省卫视', '河北卫视', NULL, 'rtp://239.45.1.44:5140', 'rtp://239.45.1.237:5140', 'rtp://239.45.3.226:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (79, 790, 'neimenggu', NULL, '内蒙古卫视', NULL, '各省卫视', '内蒙古卫视', NULL, NULL, 'rtp://239.45.1.238:5140', 'rtp://239.45.3.221:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (80, 800, 'henan', NULL, '河南卫视', NULL, '各省卫视', '河南卫视', NULL, 'rtp://239.45.0.3:5140', 'rtp://239.45.1.242:5140', 'rtp://239.45.3.225:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (81, 810, 'KBWS', NULL, '康巴卫视', NULL, '各省卫视', '康巴卫视', NULL, NULL, 'rtp://239.45.1.251:5140', NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (82, 820, 'hunanjinyingjishipindao', NULL, '金鹰纪实', NULL, '专业频道', '金鹰纪实', NULL, 'rtp://239.45.1.45:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-30 18:28:44');
INSERT INTO `iptv` VALUES (83, 830, 'jykt', NULL, '金鹰卡通', NULL, '专业频道', '金鹰卡通', NULL, NULL, 'rtp://239.45.3.119:5140', 'rtp://239.45.3.118:5140', NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (84, 840, 'cctvpayfee-kuailechuidiao', NULL, '湖南快乐垂钓', NULL, '专业频道', '湖南快乐垂钓', NULL, 'rtp://239.45.3.12:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (85, 850, 'jilu', NULL, '湖南茶频道', NULL, '专业频道', '湖南茶频道', NULL, 'rtp://239.45.3.18:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-28 11:07:01');
INSERT INTO `iptv` VALUES (86, 860, 'taoci', NULL, '江西陶瓷频道', NULL, '专业频道', '江西陶瓷频道', NULL, 'rtp://239.45.3.50:5140', NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-30 18:29:00');
INSERT INTO `iptv` VALUES (87, 870, NULL, NULL, '百事通4K轮播(电影)', NULL, '百事通', '百事通4K (电影)', 'rtp://239.45.1.9:5140', NULL, NULL, NULL, NULL, '{\"uri_4k\": [\"rtp://239.45.1.42:5140\", \"rtp://239.45.3.107:5140\"]}', '2021-07-28 03:07:01', '2021-07-30 18:30:50');
INSERT INTO `iptv` VALUES (89, 890, NULL, NULL, '百事通4K轮播(动物)', NULL, '百事通', '百事通4K (动物)', 'rtp://239.45.1.10:5140', NULL, NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-31 22:52:00');
INSERT INTO `iptv` VALUES (90, 900, NULL, NULL, '百事通4K轮播(宠物)', NULL, '百事通', '百事通4K (宠物)', 'rtp://239.45.1.11:5140', NULL, NULL, NULL, NULL, NULL, '2021-07-28 03:07:01', '2021-07-31 22:52:06');
INSERT INTO `iptv` VALUES (93, 1000, NULL, NULL, '百事通纪实', NULL, '百事通', '百事通纪实', NULL, NULL, 'rtp://239.45.1.103:5140', NULL, NULL, NULL, NULL, '2021-07-30 18:34:25');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
