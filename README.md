# 上海电信

- 组播播放列表: https://raw.githubusercontent.com/ihipop/Shanghai-IPTV/master/tel_mu.m3u8

# LOGO 目录

- https://raw.githubusercontent.com/ihipop/Shanghai-IPTV/master/tv-logo/

# 导入m3u8到数据库

`php import.php tel_mu.m3u8`

# 导出数据库到m3u8

`php export.php > tel_mu.m3u8`

## udpxy 模式

`php export.php 'udpxy=http://192.168.1.1:4022' > tel_mu.m3u8`

## 服务模式

`GET /server.php`

`GET /server.php?udpxy=http://192.168.1.1:4022`
