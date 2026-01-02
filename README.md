# 上海电信 IPTV

上海电信 IPTV 组播节目单管理工具,支持 TXT 格式导入和 M3U8 格式导出。

## 功能特性

- ✅ 支持 TXT 格式 IPTV 列表导入
- ✅ 支持 M3U8 格式导出
- ✅ 规范化数据库设计(频道、流地址、EPG映射分离)
- ✅ 支持多线路、多清晰度(4K/HD/SD/LD)
- ✅ 支持多个 EPG 源映射
- ✅ 支持 UDPXY 转换
- ✅ 服务器模式支持

## 数据库初始化

```bash
sqlite3 iptv.sqlite < schema.sql
```

## 导入 TXT 格式列表

从 TXT 文件导入到数据库:

```bash
php import.php <TXT文件路径>
```

示例:
```bash
php import.php Shanghai_IPTV_20251226.txt
```

## 导出 M3U8 格式

### 基本导出

```bash
php export.php "file=output.m3u8"
```

### 参数说明

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `file` | 输出文件名 | 必需 |
| `epg` | EPG源 (sparks/rytec/epg.pw) | sparks |
| `all_routes` | 导出所有线路 (1=是) | 仅主线路 |
| `udpxy` | UDPXY服务器地址 | 无 |

### 使用示例

**指定 EPG 源:**
```bash
php export.php "file=output.m3u8&epg=rytec"
```

**导出所有线路:**
```bash
php export.php "file=output.m3u8&all_routes=1"
```

**使用 UDPXY 转换:**
```bash
php export.php "file=output.m3u8&udpxy=http://192.168.1.1:4022"
```

**组合参数:**
```bash
php export.php "file=output.m3u8&epg=sparks&all_routes=1&udpxy=http://192.168.1.1:4022"
```

## 服务器模式

启动 PHP 内置服务器:
```bash
php -S 0.0.0.0:8080
```

访问:
- 基本: `http://localhost:8080/server.php`
- 指定文件: `http://localhost:8080/server.php?file=custom`
- 使用 UDPXY: `http://localhost:8080/server.php?udpxy=http://192.168.1.1:4022`
- 组合参数: `http://localhost:8080/server.php?file=custom&epg=rytec&udpxy=http://192.168.1.1:4022`

## 数据库结构

### channels (频道表)
- 存储频道基本信息
- 支持分类和排序

### channel_streams (流地址表)
- 存储所有流地址
- 支持多线路、多清晰度
- 支持主线路标记

### channel_epg_mappings (EPG映射表)
- 支持多个 EPG 源
- 灵活的 EPG ID 映射

## 组播播放列表

- GitHub: https://raw.githubusercontent.com/ihipop/Shanghai-IPTV/master/tel_mu.m3u8

## LOGO 目录

- https://raw.githubusercontent.com/ihipop/Shanghai-IPTV/master/tv-logo/

## 环境要求

- PHP 7.4+
- SQLite3
- Composer 依赖

## 安装依赖

```bash
composer install
```
