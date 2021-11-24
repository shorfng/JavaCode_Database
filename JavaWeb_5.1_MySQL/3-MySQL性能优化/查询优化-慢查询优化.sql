# 查看 MySQL 数据库是否开启了慢查询日志
# 查看慢查询日志文件的存储位置
show variables like 'slow_query_log%';

# 开启慢查询日志
set global slow_query_log = on;
set global slow_query_log_file = 'oak-slow.log';
set global log_queries_not_using_indexes = on;  # 表示会记录没有使用索引的查询SQL。前提是slow_query_log的值为ON，否则不会奏效
set long_query_time = 10;  # 指定慢查询的阀值，单位秒。如果SQL执行时间超过阀值，就属于慢查询，会记录到日志文件中
set long_query_time = 0.1; # 学习使用


# ============================  慢查询日志 ============================
select * from slow;


# ============================  慢查询优化 ============================

select * from student;

# 默认
explain select * from student where age = 18 and name like 'a%';  # rows - 5120

# 优化1：追加 name 索引
create index age_1 on student(age);
explain select * from student where age = 18 and name like 'a%';  # rows - 3072

# 优化2：追加 age,name 索引
create index age_name on student(age, name);
explain select * from student where age = 18 and name like 'a%';  # rows - 1706

# 优化3：为表添加 first_name 虚拟列，以及联合索引(first_name,age)
alter table student add first_name varchar(2) generated always as (left(name, 1)), add index(first_name, age);
explain select * from student where age = 18 and first_name = 'a%';  # rows - 1

