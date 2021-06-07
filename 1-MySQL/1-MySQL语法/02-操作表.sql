# 创建表
# create table 表名 (列名 列类型);
CREATE TABLE IF NOT EXISTS `tb_admin_info`
(
    `id`          INT PRIMARY KEY AUTO_INCREMENT COMMENT '序号',
    `username`    VARCHAR(20) NOT NULL COMMENT '登录账户',
    `pwd`         VARCHAR(20) NOT NULL COMMENT '密码',
    `create_user` VARCHAR(20) COMMENT '创建人',
    `create_time` DATE COMMENT '创建时间',
    `update_user` VARCHAR(20) COMMENT '修改人',
    `update_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `effective`   VARCHAR(1) COMMENT '是否有效（1有效 0无效）'
) COMMENT ='管理员信息管理表' ENGINE = InnoDB
                      DEFAULT CHARSET = utf8;

# ==============================================================================

# 修改表注释
ALTER TABLE tb_admin_info COMMENT '管理员表';

# 修改列注释
ALTER TABLE tb_admin_info MODIFY COLUMN username VARCHAR(100) COMMENT '用户名';

# 修改列类型（不带注释就会修改为无注释）
ALTER TABLE tb_admin_info MODIFY COLUMN pwd BIGINT;

# ==============================================================================

# 查询表
# select * from 表名;
select * from tb_admin_info;

# 查询某个数据库中的所有表名细信息
# select * from information_schema.tables where table_schema = '数据库名';
select * from information_schema.tables where table_schema = 'td_mysql_db';

# 截取第二个_前的字符
select substring_index(table_name,'_',2 ) from information_schema.tables where table_schema = 'td_mysql_db';


# ==============================================================================


# 删除表
# DROP TABLE 数据库名;
DROP TABLE tb_admin_info ;


# ==============================================================================

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


# ==============================================================================

# 临时表
# 创建临时表 - 通过查询其他表
# create temporary table 临时表名 as (select *  from 旧的表名 limit 0,10000);
create temporary table temp_tb_admin_info as (select *  from tb_admin_info limit 0,10000);

# 查询临时表
select * from temp_tb_admin_info;

# 删除临时表
drop table temp_tb_admin_info;


