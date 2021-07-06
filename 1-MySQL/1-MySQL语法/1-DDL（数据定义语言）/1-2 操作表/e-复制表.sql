# 复制表
#（1）只复制表结构到新表（带字段注释）
# create table 新表 select * from 旧表 where 1=2;
create table tb_admin_info1 select * from tb_admin_info where 1=2;

#（2）只复制表结构到新表（带表注释、字段注释）
# create table 新表 like 旧表;
create table tb_admin_info2 like tb_admin_info;

#（3）复制表结构及数据到新表（带字段注释）
# create table 新表 select * from 旧表;
create table tb_admin_info3 select * from tb_admin_info;

#（4）复制旧表的部分字段到新表（带数据、带字段注释）
# create table 新表 as ( select 旧表字段1, 旧表字段2 from 旧表);
create table tb_admin_info4 as ( select username, pwd from tb_admin_info);

#（5）旧表字段改名到新表（带数据、带字段注释）
# create table 新表 as (select id, 旧表字段1 as 新表字段1, 旧表字段2 as 新表字段2 from 旧表);
create table tb_admin_info5 as (select id, username as username5, pwd as pwd5 from tb_admin_info);

#（6）复制旧表的部分数据到新表（带数据、带字段注释）
# create table 新表 as ( select * from 旧表 where left(字段名,最左边的字符数) = '字段名的值匹配条件');
create table tb_admin_info6 as ( select * from tb_admin_info where left(username,2) = 'td');

# 创建新表的同时定义表中的字段信息（带数据、带字段注释）
create table tb_admin_info7 ( id integer not null auto_increment primary key) as ( select * from tb_admin_info);

