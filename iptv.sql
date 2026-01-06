PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE channels (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,                      -- 频道名称 (如 "CCTV1", "东方卫视")
    display_name VARCHAR(255),                       -- 显示名称 (如 "CCTV-综合")
    category VARCHAR(100),                           -- 分类 (如 "IPTV央视", "IPTV上海", "4K频道")
    logo VARCHAR(255),                               -- 台标路径
    sort_order INTEGER DEFAULT 0,                    -- 排序
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(name, category)                           -- 同一分类中频道名称唯一
);
INSERT INTO channels VALUES(1,'上海新闻综合','新闻综合','上海文广','上海新闻综合.png',1,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(2,'东方卫视','东方卫视','上海文广','东方卫视.png',2,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(3,'东方卫视','东方卫视','4K频道','东方卫视.png',3,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(4,'生活时尚','生活时尚','上海文广','生活时尚.png',4,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(5,'都市剧场','都市剧场','上海文广','都市剧场.png',5,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(6,'上海都市','都市频道','上海文广','上海都市.png',6,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(7,'欢笑剧场','欢笑剧场','4K频道','欢笑剧场.png',7,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(8,'欢笑剧场','欢笑剧场','数字频道','欢笑剧场.png',8,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(9,'东方影视','东方影视','上海文广','东方影视.png',9,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(10,'五星体育','五星体育','上海文广','五星体育.png',10,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(11,'北京纪实科教','纪实科教','数字频道','北京纪实科教.png',11,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(12,'金鹰纪实','金鹰纪实','数字频道','金鹰纪实.png',12,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(13,'乐游','乐游','数字频道','乐游.png',13,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(14,'茶频道','茶频道','数字频道','茶频道.png',14,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(15,'上海第一财经','第一财经','上海文广','上海第一财经.png',15,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(16,'东方财经','东方财经','上海文广','东方财经.png',16,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(17,'家庭理财','家庭理财','数字频道','家庭理财.png',17,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(18,'财富天下','财富天下','数字频道','财富天下.png',18,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(19,'法治天地','法治天地','数字频道','法治天地.png',19,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(20,'上海教育','上海教育','上海文广','上海教育.png',20,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(21,'快乐垂钓','快乐垂钓','数字频道','快乐垂钓.png',21,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(22,'游戏风云','游戏风云','数字频道','游戏风云.png',22,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(23,'BesTV电影','BesTV电影','4K频道',NULL,23,'2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channels VALUES(24,'BesTV记录','BesTV记录','4K频道',NULL,24,'2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channels VALUES(25,'BesTV电影介绍','BesTV电影介绍','数字频道',NULL,25,'2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channels VALUES(26,'未知','未知','数字频道',NULL,26,'2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channels VALUES(27,'IPTV测试','IPTV测试','数字频道',NULL,27,'2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channels VALUES(28,'CCTV1','CCTV1','CCTV','CCTV1.png',28,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(29,'CCTV2','CCTV2','CCTV','CCTV2.png',29,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(30,'CCTV3','CCTV3','CCTV','CCTV3.png',30,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(31,'CCTV4','CCTV4','CCTV','CCTV4.png',31,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(32,'CCTV5','CCTV5','CCTV','CCTV5.png',32,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(33,'CCTV5+','CCTV5+','CCTV','CCTV5+.png',33,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(34,'CCTV6','CCTV6','CCTV','CCTV6.png',34,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(35,'CCTV7','CCTV7','CCTV','CCTV7.png',35,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(36,'CCTV8','CCTV8','CCTV','CCTV8.png',36,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(37,'CCTV9','CCTV9','CCTV','CCTV9.png',37,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(38,'CCTV10','CCTV10','CCTV','CCTV10.png',38,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(39,'CCTV11','CCTV11','CCTV','CCTV11.png',39,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(40,'CCTV12','CCTV12','CCTV','CCTV12.png',40,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(41,'CCTV13','CCTV13','CCTV','CCTV13.png',41,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(42,'CCTV14','CCTV14','CCTV','CCTV14.png',42,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(43,'CCTV15','CCTV15','CCTV','CCTV15.png',43,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(44,'CCTV16','CCTV16','CCTV','CCTV16.png',44,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(45,'CCTV16','CCTV16','4K频道','CCTV16.png',45,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(46,'CCTV17','CCTV17','CCTV','CCTV17.png',46,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(47,'CCTV4K','CCTV4K','4K频道','CCTV4K.png',47,'2026-01-03 14:47:15','2026-01-03 16:40:31');
INSERT INTO channels VALUES(48,'CHC动作电影','CHC动作电影','数字频道','CHC动作电影.png',48,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(49,'CHC家庭影院','CHC家庭影院','数字频道','CHC家庭影院.png',49,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(50,'CHC影迷电影','CHC影迷电影','数字频道','CHC影迷电影.png',50,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(51,'兵器科技','CCTV兵器科技','数字频道','兵器科技.png',51,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(52,'第一剧场','CCTV第一剧场','数字频道','第一剧场.png',52,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(53,'风云剧场','CCTV风云剧场','数字频道','风云剧场.png',53,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(54,'风云音乐','CCTV风云音乐','数字频道','风云音乐.png',54,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(55,'风云足球','CCTV风云足球','数字频道','风云足球.png',55,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(56,'高尔夫网球','CCTV高尔夫网球','数字频道','高尔夫网球.png',56,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(57,'怀旧剧场','CCTV怀旧剧场','数字频道','怀旧剧场.png',57,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(58,'女性时尚','CCTV女性时尚','数字频道','女性时尚.png',58,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(59,'世界地理','CCTV世界地理','数字频道','世界地理.png',59,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(60,'文化精品','CCTV文化精品','数字频道','文化精品.png',60,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(61,'央视台球','CCTV央视台球','数字频道','央视台球.png',61,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(62,'CETV1','CETV1','CCTV','CETV1.png',62,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(63,'CETV2','CETV2','CCTV','CETV2.png',63,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(64,'CETV4','CETV4','CCTV','CETV4.png',64,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(65,'CETV早期教育','CETV早期教育','CCTV','CETV早期教育.png',65,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(66,'CGTN','CGTN','CCTV','CGTN.png',66,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(67,'安徽卫视','安徽卫视','卫视频道','安徽卫视.png',67,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(68,'北京卫视','北京卫视','卫视频道','北京卫视.png',68,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(69,'北京卫视','北京卫视','4K频道','北京卫视.png',69,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(70,'兵团卫视','兵团卫视','卫视频道','兵团卫视.png',70,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(71,'东南卫视','东南卫视','卫视频道','东南卫视.png',71,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(72,'甘肃卫视','甘肃卫视','卫视频道','甘肃卫视.png',72,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(73,'广东卫视','广东卫视','卫视频道','广东卫视.png',73,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(74,'广东卫视','广东卫视','4K频道','广东卫视.png',74,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(75,'广西卫视','广西卫视','卫视频道','广西卫视.png',75,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(76,'贵州卫视','贵州卫视','卫视频道','贵州卫视.png',76,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(77,'海南卫视','海南卫视','卫视频道','海南卫视.png',77,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(78,'河北卫视','河北卫视','卫视频道','河北卫视.png',78,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(79,'河南卫视','河南卫视','卫视频道','河南卫视.png',79,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(80,'黑龙江卫视','黑龙江卫视','卫视频道','黑龙江卫视.png',80,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(81,'湖北卫视','湖北卫视','卫视频道','湖北卫视.png',81,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(82,'湖南卫视','湖南卫视','卫视频道','湖南卫视.png',82,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(83,'湖南卫视','湖南卫视','4K频道','湖南卫视.png',83,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(84,'吉林卫视','吉林卫视','卫视频道','吉林卫视.png',84,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(85,'江苏卫视','江苏卫视','卫视频道','江苏卫视.png',85,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(86,'江苏卫视','江苏卫视','4K频道','江苏卫视.png',86,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(87,'江西卫视','江西卫视','卫视频道','江西卫视.png',87,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(88,'辽宁卫视','辽宁卫视','卫视频道','辽宁卫视.png',88,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(89,'内蒙古卫视','内蒙古卫视','卫视频道','内蒙古卫视.png',89,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(90,'宁夏卫视','宁夏卫视','卫视频道','宁夏卫视.png',90,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(91,'青海卫视','青海卫视','卫视频道','青海卫视.png',91,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(92,'三沙卫视','三沙卫视','卫视频道','三沙卫视.png',92,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(93,'山东卫视','山东卫视','卫视频道','山东卫视.png',93,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(94,'山东卫视','山东卫视','4K频道','山东卫视.png',94,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(95,'山西卫视','山西卫视','卫视频道','山西卫视.png',95,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(96,'陕西卫视','陕西卫视','卫视频道','陕西卫视.png',96,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(97,'深圳卫视','深圳卫视','卫视频道','深圳卫视.png',97,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(98,'深圳卫视','深圳卫视','4K频道','深圳卫视.png',98,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(99,'四川卫视','四川卫视','卫视频道','四川卫视.png',99,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(100,'四川卫视','四川卫视','4K频道','四川卫视.png',100,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(101,'天津卫视','天津卫视','卫视频道','天津卫视.png',101,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(102,'西藏卫视','西藏卫视','卫视频道','西藏卫视.png',102,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(103,'新疆卫视','新疆卫视','卫视频道','新疆卫视.png',103,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(104,'延边卫视','延边卫视','卫视频道','延边卫视.png',104,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(105,'云南卫视','云南卫视','卫视频道','云南卫视.png',105,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(106,'浙江卫视','浙江卫视','卫视频道','浙江卫视.png',106,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(107,'浙江卫视','浙江卫视','4K频道','浙江卫视.png',107,'2026-01-03 14:47:15','2026-01-03 16:37:44');
INSERT INTO channels VALUES(108,'重庆卫视','重庆卫视','卫视频道','重庆卫视.png',108,'2026-01-03 14:47:15','2026-01-03 16:37:45');
INSERT INTO channels VALUES(109,'金色学堂','金色学堂','少儿频道','金色学堂.png',109,'2026-01-03 14:47:15','2026-01-03 16:40:31');
INSERT INTO channels VALUES(110,'BesTV动画','BesTV动画','4K频道',NULL,110,'2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channels VALUES(111,'动漫秀场','动漫秀场','少儿频道','动漫秀场.png',111,'2026-01-03 14:47:15','2026-01-03 16:40:31');
INSERT INTO channels VALUES(112,'哈哈炫动','哈哈炫动','少儿频道','哈哈炫动.png',112,'2026-01-03 14:47:15','2026-01-03 16:40:31');
INSERT INTO channels VALUES(113,'嘉佳卡通','嘉佳卡通','少儿频道','嘉佳卡通.png',113,'2026-01-03 14:47:15','2026-01-03 16:40:31');
INSERT INTO channels VALUES(114,'金鹰卡通','金鹰卡通','少儿频道','金鹰卡通.png',114,'2026-01-03 14:47:15','2026-01-03 16:40:31');
INSERT INTO channels VALUES(115,'卡酷少儿','卡酷少儿','少儿频道','卡酷少儿.png',115,'2026-01-03 14:47:15','2026-01-03 16:40:31');
CREATE TABLE channel_streams (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    channel_id INTEGER NOT NULL,                  -- 关联频道ID
    stream_url VARCHAR(500) NOT NULL,             -- 流地址
    quality VARCHAR(20) DEFAULT 'SD',             -- 清晰度: 4K, HD, SD, LD
    route_index INTEGER DEFAULT 1,                -- 线路编号 (1为主线路, 2,3...为备用线路)
    status VARCHAR(20) DEFAULT 'active',          -- 状态: active, inactive
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (channel_id) REFERENCES channels(id) ON DELETE CASCADE
);
INSERT INTO channel_streams VALUES(1,1,'rtp://233.18.204.57:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(2,2,'rtp://233.18.204.51:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(3,3,'rtp://233.18.204.224:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(4,4,'rtp://233.18.204.45:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(5,5,'rtp://233.18.204.48:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(6,6,'rtp://233.18.204.53:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(7,7,'rtp://233.18.204.115:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(8,7,'rtp://233.18.204.205:5140','4K',2,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(9,8,'rtp://233.18.204.50:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(10,9,'rtp://233.18.204.55:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(11,10,'rtp://233.18.204.58:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(12,11,'rtp://239.45.1.14:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(13,12,'rtp://233.18.204.104:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(14,13,'rtp://233.18.204.47:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(15,14,'rtp://233.18.204.43:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(16,15,'rtp://233.18.204.59:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(17,16,'rtp://233.18.204.65:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(18,17,'rtp://233.18.204.157:5140','SD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(19,18,'rtp://233.18.204.231:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(20,19,'rtp://233.18.204.49:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(21,20,'rtp://233.18.204.63:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(22,21,'rtp://233.18.204.42:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(23,22,'rtp://233.18.204.44:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(24,23,'rtp://233.18.204.169:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(25,24,'rtp://233.18.204.170:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(26,25,'rtp://233.18.204.116:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(27,26,'rtp://233.18.204.202:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(28,27,'rtp://233.18.204.201:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(29,28,'rtp://233.18.204.168:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(30,28,'rtp://233.18.204.52:5140','HD',2,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(31,29,'rtp://233.18.204.68:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(32,30,'rtp://233.18.204.69:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(33,31,'rtp://233.18.204.70:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(34,32,'rtp://233.18.204.71:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(35,33,'rtp://233.18.204.67:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(36,34,'rtp://233.18.204.72:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(37,35,'rtp://233.18.204.73:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(38,36,'rtp://233.18.204.74:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(39,37,'rtp://233.18.204.75:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(40,38,'rtp://233.18.204.76:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(41,39,'rtp://233.18.204.77:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(42,40,'rtp://233.18.204.78:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(43,41,'rtp://233.18.204.79:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(44,42,'rtp://233.18.204.80:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(45,43,'rtp://233.18.204.81:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(46,44,'rtp://233.18.204.82:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(47,45,'rtp://233.18.204.114:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(48,45,'rtp://233.18.204.215:5140','4K',2,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(49,46,'rtp://233.18.204.83:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(50,47,'rtp://233.18.204.188:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(51,47,'rtp://233.18.204.204:5140','4K',2,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(52,48,'rtp://233.18.204.174:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(53,49,'rtp://233.18.204.173:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(54,50,'rtp://233.18.204.175:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(55,51,'rtp://233.18.204.178:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(56,52,'rtp://233.18.204.184:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(57,53,'rtp://233.18.204.183:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(58,54,'rtp://233.18.204.185:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(59,55,'rtp://233.18.204.176:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(60,56,'rtp://233.18.204.181:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(61,57,'rtp://233.18.204.182:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(62,58,'rtp://233.18.204.180:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(63,59,'rtp://233.18.204.179:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(64,60,'rtp://233.18.204.186:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(65,61,'rtp://233.18.204.177:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(66,62,'rtp://233.18.204.98:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(67,63,'rtp://233.18.204.154:5140','SD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(68,64,'rtp://233.18.204.111:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(69,65,'rtp://233.18.204.187:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(70,66,'rtp://233.18.204.28:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(71,67,'rtp://233.18.204.93:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(72,68,'rtp://233.18.204.87:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(73,69,'rtp://233.18.204.209:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(74,70,'rtp://233.18.204.221:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(75,71,'rtp://233.18.204.94:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(76,72,'rtp://233.18.204.110:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(77,73,'rtp://233.18.204.88:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(78,74,'rtp://233.18.204.218:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(79,75,'rtp://233.18.204.107:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(80,76,'rtp://233.18.204.101:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(81,77,'rtp://233.18.204.102:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(82,78,'rtp://233.18.204.103:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(83,79,'rtp://233.18.204.105:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(84,80,'rtp://233.18.204.90:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(85,81,'rtp://233.18.204.92:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(86,82,'rtp://233.18.204.86:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(87,83,'rtp://233.18.204.227:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(88,84,'rtp://233.18.204.108:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(89,85,'rtp://233.18.204.85:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(90,86,'rtp://233.18.204.226:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(91,87,'rtp://233.18.204.95:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(92,88,'rtp://233.18.204.96:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(93,89,'rtp://233.18.204.217:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(94,90,'rtp://233.18.204.230:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(95,91,'rtp://233.18.204.112:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(96,92,'rtp://233.18.204.172:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(97,93,'rtp://233.18.204.91:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(98,94,'rtp://233.18.204.228:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(99,95,'rtp://233.18.204.211:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(100,96,'rtp://233.18.204.223:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(101,97,'rtp://233.18.204.89:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(102,98,'rtp://233.18.204.219:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(103,99,'rtp://233.18.204.99:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(104,100,'rtp://233.18.204.225:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(105,101,'rtp://233.18.204.97:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(106,102,'rtp://233.18.204.222:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(107,103,'rtp://233.18.204.220:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(108,104,'rtp://233.18.204.155:5140','SD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(109,105,'rtp://233.18.204.106:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(110,106,'rtp://233.18.204.84:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(111,107,'rtp://233.18.204.229:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(112,108,'rtp://233.18.204.100:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(113,109,'rtp://233.18.204.66:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(114,110,'rtp://233.18.204.171:5140','4K',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(115,111,'rtp://233.18.204.46:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(116,112,'rtp://233.18.204.54:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(117,113,'rtp://233.18.204.151:5140','SD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(118,114,'rtp://233.18.204.113:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
INSERT INTO channel_streams VALUES(119,115,'rtp://233.18.204.109:5140','HD',1,'active','2026-01-03 14:47:15','2026-01-03 14:47:15');
CREATE TABLE channel_epg_mappings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    channel_id INTEGER NOT NULL,                  -- 关联频道ID
    epg_source VARCHAR(50) NOT NULL,              -- EPG源名称 (如 "rytec", "sparks", "epg.pw")
    epg_id VARCHAR(100) NOT NULL,                 -- 该EPG源中的频道ID
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (channel_id) REFERENCES channels(id) ON DELETE CASCADE,
    UNIQUE(channel_id, epg_source)
);
CREATE TABLE category_order (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category VARCHAR(100) NOT NULL UNIQUE,
    sort_order INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO category_order VALUES(1,'上海文广',1,'2026-01-06 03:33:21','2026-01-06 03:33:21');
INSERT INTO category_order VALUES(2,'CCTV',2,'2026-01-06 03:33:21','2026-01-06 03:33:21');
INSERT INTO category_order VALUES(3,'卫视频道',3,'2026-01-06 03:33:21','2026-01-06 03:33:21');
INSERT INTO category_order VALUES(4,'4K频道',6,'2026-01-06 03:33:21','2026-01-06 03:33:21');
INSERT INTO category_order VALUES(5,'数字频道',4,'2026-01-06 03:33:21','2026-01-06 03:33:21');
INSERT INTO category_order VALUES(6,'少儿频道',5,'2026-01-06 03:33:21','2026-01-06 03:33:21');
PRAGMA writable_schema=ON;
CREATE TABLE IF NOT EXISTS sqlite_sequence(name,seq);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('channels',115);
INSERT INTO sqlite_sequence VALUES('channel_streams',119);
INSERT INTO sqlite_sequence VALUES('category_order',6);
CREATE INDEX idx_channels_category ON channels(category);
CREATE INDEX idx_channels_sort ON channels(sort_order);
CREATE INDEX idx_channels_name ON channels(name);
CREATE INDEX idx_streams_channel ON channel_streams(channel_id);
CREATE INDEX idx_streams_quality ON channel_streams(quality);
CREATE INDEX idx_streams_status ON channel_streams(status);
CREATE INDEX idx_epg_source ON channel_epg_mappings(epg_source);
CREATE INDEX idx_epg_channel ON channel_epg_mappings(channel_id);
CREATE INDEX idx_category_order_sort ON category_order(sort_order);
PRAGMA writable_schema=OFF;
COMMIT;
