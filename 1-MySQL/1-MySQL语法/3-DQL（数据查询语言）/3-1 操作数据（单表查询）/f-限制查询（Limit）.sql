# 通过 limit 指定查询多少行数据，限制返回的查询结果的行数

# 参数说明
# select * : 返回所有记录
# limit N : 返回 N 条记录
# offset M : 起始行数, 从0开始记数, 如果省略，则默认为0
# limit N,M : 相当于 limit M offset N , 从第 N 条记录开始, 返回 M 条记录

# select 字段1,字段2 from 表名 where 条件1,条件2 order by 字段3,字段4 desc limit n offset m ;
# select 字段1,字段2 from 表名 where 条件1,条件2 order by 字段3,字段4 desc limit n, m ;

# 查询前5条
select * from tb_admin_info limit 0,5;

# 从第4条开始,查询6条
select * from tb_admin_info limit 3,6;

# 分页公式：起始索引 = (当前页 - 1) * 每页条数
# 每页显示3条数据
select * from tb_admin_info limit 0,3;  -- 第 1 页
select * from tb_admin_info limit 3,3;  -- 第 2 页
select * from tb_admin_info limit 6,3;  -- 第 3 页

