# 查看是否开启，SQL查询诊断分析工具
show variables like 'profiling';

# 打开，SQL查询诊断分析工具
set profiling = 1;

# 查看 sql 执行时间
show profiles;


# ==================================================================================


# 第一个参数指定第一个返回记录行的偏移量，注意从0开始；
# 第二个参数指定返回记录行的最大数目；
# 如果只给定一个参数，它表示返回最大的记录行数目
# select * from 表名 limit [offset,] rows;


# 偏移量固定，返回记录数变化
select * from slow limit 10000,1;
select * from slow limit 10000,10;
select * from slow limit 10000,100;
select * from slow limit 10000,1000;
select * from slow limit 10000,10000;

# 偏移量变化，返回记录数固定
select * from slow limit 1,100;
select * from slow limit 10,100;
select * from slow limit 100,100;
select * from slow limit 1000,100;
select * from slow limit 10000,1000;

# ==================================================================================


# 分页查询优化
# 方式1：利用覆盖索引优化
select id from slow limit 10000,100;

# 方式2：利用子查询优化
# 使用了id做主键比较(id>=)，并且子查询使用了覆盖索引进行优化
select * from slow where id>= (select id from slow limit 10000,1) limit 100;
