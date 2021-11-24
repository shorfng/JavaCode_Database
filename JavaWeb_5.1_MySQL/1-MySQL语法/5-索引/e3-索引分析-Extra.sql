# =================== Extra表示很多额外的信息，各种操作会在Extra提示相关信息 =====================================

# Using where：表示查询需要通过索引回表查询数据
explain select * from t_user where age > 18;

# Using index：表示查询需要通过索引，索引就可以满足所需数据
explain select id from t_user order by id;     # Using index
explain select age from t_user where age = 18; # Using index
explain select age from t_user where age > 18; # Using where; Using index

# Using filesort：表示查询出来的结果需要额外排序，数据量小在内存，数据量大在磁盘，因此有 Using filesort 建议优化
explain select * from t_user order by age; # Using filesort
explain select id from t_user where age = 18 order by name; # Using where; Using filesort

# Using temporary：查询使用到了临时表，一般出现于去重、分组等操作
explain select distinct(name) from t_user;  # name 没有索引
explain select distinct(age) from t_user;   # age 有索引，extra = Using index for group-by
explain select * from t_user group by name; # name 没有索引，extra =Using temporary; Using filesort
explain select * from t_user group by age;  # age 有索引，extra = null

# 不可能
explain select * from t_user where 1 < 0;                # Impossible WHERE
explain select * from t_user group by age having 1 < 0;  # Impossible HAVING



