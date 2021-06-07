# 查询数据
#（1）通用查询
# 查询表的所有数据
# select * from 表名;
select * from tb_admin_info;

# 查询表字段数据
# select 字段1,字段2,字段3 from 表名;
select id,username,pwd,create_user,create_time,update_user,update_time,effective from tb_admin_info;


#（2）Where子句 - 条件查询
# select * from 表名 where 条件1 = '值' and/or 条件2 = '值';
select * from tb_admin_info where username = 'TD';
select * from tb_admin_info where username = 'TD' and pwd = '123';
select * from tb_admin_info where username = 'TD' or username = 'CJ';


#（3）Like子句 - 模糊查询
# select * from 表名 where 条件1 like '%值%';
select * from tb_admin_info where username like '%T%'; -- 查看包含T的
select * from tb_admin_info where username like 'T%';  -- 查询 T 开头的
select * from tb_admin_info where username like '%T';  -- 查询 T 结尾的
select * from tb_admin_info where username like 'T';   -- 查询值为 T 的

# select * from 表名 where 条件1 like '_值_';
select * from tb_admin_info where username like '_t_';    -- 该值有三位且中间字母是 t 的
select * from tb_admin_info where username like '_t';     -- 该值有两位且结尾字母是 t 的
select * from tb_admin_info where username like 't_';     -- 该值有两位且开头字母是 t 的


#（4）Union
# union 左右两边的列的数量要一样，一般是两个表有相同的列
# all: 可选，返回所有结果集，包含重复数据
# distinct: 可选，删除结果集中重复的数据（默认情况下 union 操作符已经删除了重复数据，所以 distinct 修饰符对结果没影响）
# select 字段1, 字段2 from 表1 where 条件1 = '' union/all/distinct select 字段1, 字段2 from 表2 where 条件2 = '';

# union 语句：用于将不同表中相同列中查询的数据展示出来（不包括重复数据）
# select 列名称 from 表名称 union select 列名称 from 表名称 order by 列名称;
select id, username, pwd from tb_admin_info union select id, username, pwd from tb_admin_info order by username;
select id, username, pwd from tb_admin_info union select id, username, pwd from tb_admin_info order by username;

# union all 语句：用于将不同表中相同列中查询的数据展示出来（包括重复数据）
# select 列名称 from 表名称 union all select 列名称 from 表名称 order by 列名称;
select id, username, pwd from tb_admin_info union all select id, username, pwd from tb_admin_info order by username;

# 排序
# asc：升序（默认，可以省略不写）  desc：降序
# select 字段1, 字段2 from 表名1, 表名2 order by 字段1, 字段2;
# select 字段1, 字段2 from 表名1, 表名2 order by 字段1, 字段2 asc;
# select 字段1, 字段2 from 表名1, 表名2 order by 字段1, 字段2 desc;
select * from tb_admin_info order by username ;
select * from tb_admin_info order by username asc ;
select * from tb_admin_info order by username desc ;

#【待验证】拼音排序：如果字符集采用的是 gbk(汉字编码字符集)，直接在查询语句后边添加 ORDER BY
select * from tb_admin_info order by username desc ;

#【待验证】拼音排序：如果字符集采用的是 utf8(万国码)，需要先对字段进行转码然后排序
select * from tb_admin_info order by CONVERT(username using gbk) desc ;


# 分组
select 列名, function(列名) from 表名 where 列名 operator value group by 列名;


# 连接



#（2）分页查询
# 查询语句中你可以使用一个或者多个表，表之间使用逗号(,)分割，并使用WHERE语句来设定查询条件。
# SELECT 命令可以读取一条或者多条记录。
# 你可以使用星号（*）来代替其他字段，SELECT语句会返回表的所有字段数据
# 你可以使用 WHERE 语句来包含任何条件。
# 你可以使用 LIMIT 属性来设定返回的记录数。
# 你可以通过OFFSET指定SELECT语句开始查询的数据偏移量。默认情况下偏移量为0。
# select * : 返回所有记录
#  limit N : 返回 N 条记录
#  offset M : 跳过 M 条记录, 默认 M=0, 单独使用似乎不起作用
#  limit N,M : 相当于 limit M offset N , 从第 N 条记录开始, 返回 M 条记录

# select 字段1,字段2 from 表名 where 条件1,条件2 order by 字段3,字段4 desc limit n offset m ;


