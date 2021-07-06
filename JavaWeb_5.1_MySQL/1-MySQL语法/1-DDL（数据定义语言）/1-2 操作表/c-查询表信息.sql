# 查询表数据
# select * from 表名;
select * from tb_admin_info;

# 查询某个数据库中的所有表名细信息
# select * from information_schema.tables where table_schema = '数据库名';
select * from information_schema.tables where table_schema = 'td_mysql_db';

# 截取第二个_前的字符
select substring_index(table_name,'_',2 ) from information_schema.tables where table_schema = 'td_mysql_db';

# 查看当前数据库中的所有表名
show tables;

# 查看某个数据表的结构
desc tb_admin_info;