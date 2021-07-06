# 查看所有用户信息和权限
select * from mysql.user;

# 查看某个用户的权限信息
# show grants for '用户名'@'主机名/主机ip';
show grants for 'root'@'localhost';

