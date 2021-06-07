# 使用【慢查询日志】功能，获取所有查询时间比较长的SQL语句 3秒-5秒
# 使用explain查看有问题的SQL的执行计划，重点查看索引使用情况
explain select * from tb_admin_info where username='td' and pwd='123';


# 排序字段加索引
explain select * from tb_admin_info where username='td' order by username ;


# 如果限制条件中其他字段没有索引，尽量少用or
# or两边的字段中，如果有一个不是索引字段，会造成该查询不走索引的情况
explain select * from tb_admin_info where username='td' or pwd='123';

# ORDER BY RAND() 不走索引
select * from tb_admin_info order by rand() limit 5;


# 避免在where子句中对字段进行表达式操作
# 对字段就行了算术运算，这会造成引擎放弃使用索引
select * from tb_admin_info where pwd * 2 = 246;
# 建议修改为
select * from tb_admin_info where pwd = 246/2;


show engines
SHOW TABLE STATUS
show variables like '%innodb_undo%';