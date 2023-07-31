# 1、进入到 Mysql 安装目录的 bin目录下

# 2、执行备份
# 格式
# mysqldump -u 用户名 -p 密码 数据库 > 文件路径

# 举例：备份 数据库 db2 中的数据到 D 盘的 db2.sql 文件中
mysqldump -uroot -p123456 db2 > D:/db2.sql
