# 方式 1：使用 create user 语句创建用户
# create user '用户名'@'主机名' identified by '密码';
create user 'td'@'localhost' identified by 'td';

# % 表示用户可以在任意电脑登录 mysql 服务器
create user 'cj'@'%' identified by 'cj';

# -----------------------------------------------------------

# 方式 2：使用 insert 语句新建用户
# 可以使用 insert 语句将用户的信息添加到 mysql.user 表中，但必须拥有对 mysql.user 表的 insert 权限
# 通常 insert 语句只添加 host、user、authentication_string 这3个字段的值
# mysql 5.7+，user 表中的密码字段为authentication_string
# mysql 5.7-，user 表中的密码字段为 password
insert into mysql.user(host, user, authentication_string, ssl_cipher, x509_issuer, x509_subject)
values ('localhost', 'test1', password('test1'), '', '', '');

# -----------------------------------------------------------

# 方式 3：使用 grant 语句新建用户
# 权限：create、alter、select、insert、update（授予所有的权限则使用 all）
# grant 权限 1, 权限 2... on 数据库名.表名 to '用户名'@'主机名' identified by '密码';

# 创建 查询权限 的用户
grant select on *.* to 'test2'@localhost identified by 'test2';
grant select on *.* to 'test3'@'%' identified by 'test3';

# 创建 所有权限 的用户
grant all on *.* to 'test4'@localhost identified by 'test4';
grant all on *.* to 'test5'@'%' identified by 'test5';

# -----------------------------------------------------------

# 授权

# GRANT priv_type [(column_list)] ON database.table
# TO user [IDENTIFIED BY [PASSWORD] 'password']
# [, user[IDENTIFIED BY [PASSWORD] 'password']] ...
# [WITH with_option [with_option]...]

# 其中：
# priv_type 参数表示权限类型；
# columns_list 参数表示权限作用于哪些列上，省略该参数时，表示作用于整个表；
# database.table 用于指定权限的级别；
# user 参数表示用户账户，由用户名和主机名构成，格式是“'username'@'hostname'”；
# IDENTIFIED BY 参数用来为用户设置密码；
# password 参数是用户的新密码。

# WITH 关键字后面带有一个或多个 with_option 参数。这个参数有 5 个选项，详细介绍如下：
# GRANT OPTION：被授权的用户可以将这些权限赋予给别的用户；
# MAX_QUERIES_PER_HOUR count：设置每个小时可以允许执行 count 次查询；
# MAX_UPDATES_PER_HOUR count：设置每个小时可以允许执行 count 次更新；
# MAX_CONNECTIONS_PER_HOUR count：设置每小时可以建立 count 个连接;
# MAX_USER_CONNECTIONS count：设置单个用户可以同时具有的 count 个连接。

# MySQL 中可以授予的权限有如下几组：
# 列权限，和表中的一个具体列相关。例如，可以使用 UPDATE 语句更新表 students 中 name 列的值的权限。
# 表权限，和一个具体表中的所有数据相关。例如，可以使用 SELECT 语句查询表 students 的所有数据的权限。
# 数据库权限，和一个具体的数据库中的所有表相关。例如，可以在已有的数据库 mytest 中创建新表的权限。
# 用户权限，和 MySQL 中所有的数据库相关。例如，可以删除已有的数据库或者创建一个新的数据库的权限。

# 在 GRANT 语句中可用于指定权限级别的值有以下几类格式：
# *：表示当前数据库中的所有表。
# *.*：表示所有数据库中的所有表。
# db_name.*：表示某个数据库中的所有表，db_name 指定数据库名。
# db_name.tbl_name：表示某个数据库中的某个表或视图，db_name 指定数据库名，tbl_name 指定表名或视图名。
# db_name.routine_name：表示某个数据库中的某个存储过程或函数，routine_name 指定存储过程名或函数名。
# TO 子句：如果权限被授予给一个不存在的用户，MySQL 会自动执行一条 CREATE USER 语句来创建这个用户，但同时必须为该用户设置密码。


