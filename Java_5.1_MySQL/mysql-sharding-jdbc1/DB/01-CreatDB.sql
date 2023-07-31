# 创建数据库
create database if not exists `sharding-jdbc1` default character set utf8mb4 collate utf8mb4_unicode_ci;
create database if not exists `sharding-jdbc2` default character set utf8mb4 collate utf8mb4_unicode_ci;

# 选择数据库
use `sharding-jdbc1`;
