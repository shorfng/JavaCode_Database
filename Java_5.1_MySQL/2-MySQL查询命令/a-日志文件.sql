# 错误日志（Error log）：默认开启
show variables like '%log_error%';


# 通用查询日志（General query log）：记录一般查询语句
show variables like '%general%';


# 二进制日志（binary log）
# 记录了对 MySQL 数据库执行的更改操作，并且记录了语句的发生时间、执行时长；但是它不记录 select、show 等不修改数据库的SQL
# 主要用于数据库恢复和主从复制
show variables like '%log_bin%';  # 是否开启
show variables like '%binlog%';   # 参数查看
show binary logs;                 # 查看日志文件


# 慢查询日志（Slow query log）：记录所有执行时间超时的查询SQL，默认是10秒
show variables like '%slow_query%';       # 是否开启
show variables like '%long_query_time%';  # 时长
