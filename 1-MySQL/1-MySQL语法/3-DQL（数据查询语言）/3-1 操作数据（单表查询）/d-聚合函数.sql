# select 聚合函数(字段名) from 表名;

# count(字段) 统计指定列不为NULL的记录行数
# sum(字段)   计算指定列的数值和
# max(字段)   计算指定列的最大值
# min(字段)   计算指定列的最小值
# avg(字段)   计算指定列的平均值

# -----------------------------------------------------

# 1、count(字段) 统计指定列不为NULL的记录行数
#（1）1与 * 效果一样
select COUNT(1) from tb_admin_info;
select COUNT(*) from tb_admin_info;

#（2）统计表中某个字段的记录条数
select COUNT(username) from tb_admin_info;

#（3）count函数忽略了空值，所以使用时注意不要使用带有null的列进行统计


