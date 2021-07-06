# Where子句 - 条件查询

# 1、比较运算符
#（1） >    <     >=      <=     =    <>    !=
#    大于、小于、大于等于、小于等于、等于、不等于、不等于

#（2）between ... and ... 在某一区间的值
# select * from 表名 where 字段 between xx and xx;

#（3）in 集合表示多个值，使用逗号分隔，in中的每个数据都会作为一次条件，只要满足条件就会显示
# select * from 表名 where 字段 in ('xx','xx');

#（4）Like子句 - 模糊查询
# select * from 表名 where 条件1 like '%值%';
select * from tb_admin_info where username like '%T%'; -- 查看包含T的
select * from tb_admin_info where username like 'T%';  -- 查询 T 开头的
select * from tb_admin_info where username like '%T';  -- 查询 T 结尾的
select * from tb_admin_info where username like 'T';   -- 查询值为 T 的

# select * from 表名 where 条件1 like '_值_';
select * from tb_admin_info where username like '_t_';    -- 该值有三位且中间字母是 t 的
select * from tb_admin_info where username like '_t';     -- 该值有两位且结尾字母是 t 的
select * from tb_admin_info where username like 't_';     -- 该值有两位且开头字母是 t 的

#（5）查询某一列为 NULL 的值
# select * from 表名 where 字段 is null;
select * from tb_admin_info where effective is null;


# 2、逻辑运算符
#（1）多个条件同时成立（and 或者 &&）
# select * from 表名 where 条件1 = '值' and 条件2 = '值';
select * from tb_admin_info where username = 'TD' and pwd = '123';
# select * from 表名 where 条件1 = '值' && 条件2 = '值';
select * from tb_admin_info where username = 'TD' && pwd = '123';

#（2）多个条件任一成立（or 或者 ||）
# select * from 表名 where 条件1 = '值' or 条件2 = '值';
select * from tb_admin_info where username = 'TD' or username = 'CJ';
# select * from 表名 where 条件1 = '值' || 条件2 = '值';
select * from tb_admin_info where username = 'TD' || username = 'CJ';

#（3）不成立，取反（not）
select * from tb_admin_info where username not in ('TD');
select * from tb_admin_info where id not between 2 and 3;
