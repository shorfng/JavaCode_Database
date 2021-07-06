# 删除数据

# 1、delete 删除整张表的数据，不会释放表所占用的空间，并且操作是可以撤销
# 删除所有数据
# delete from 表名;

# 指定条件 删除数据
# delete from 表名 where 字段名 = 值;

# 2、drop 删除表的结构，以及被依赖的约束(constrain)、触发器(trigger)、索引(index)
# drop table 数据库名;
drop table tb_admin_info ;

# 判断表是否存在， 存在的话就删除,不存在就不执行删除
drop table if exists tb_admin_info;

# 3、truncate 删除内容、释放空间但不删除表的结构(定义)
# truncate table 表名;


# 注意
# truncate 只能对table
# delete 可以是 table 和 view
# 执行速度：drop > truncate > delete

