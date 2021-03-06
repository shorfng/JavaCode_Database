# 唯一索引（unique）
# 与"普通索引"类似，不同的就是：索引字段的值必须唯一，但允许有空值
# 在创建或修改表时追加唯一约束，就会自动创建对应的唯一索引，唯一索引可以保证数据记录的唯一性
# 特点：索引列的所有值都只能出现一次，必须唯一

# ------------------------------------------------------

# 方式1：创建表的时候直接添加主键索引
# create table 表名(
#     列名 类型(长度),
#     unique [索引名称] (列名)
# );

# 方式2：使用create语句创建，在已有的表上创建索引
# create unique index 索引名 on 表名(列名(长度));

# 方式3：修改表结构添加索引
# alter table 表名 add unique (列名);



