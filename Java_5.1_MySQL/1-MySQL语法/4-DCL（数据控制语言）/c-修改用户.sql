# rename user <旧用户> to <新用户>
# 必须拥有 mysql 数据库的 update 权限或全局 create user 权限
rename user 'test1'@'localhost' to 'test2'@'localhost';


