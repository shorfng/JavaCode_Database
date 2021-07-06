# 约束的作用: 对表中的数据进行进一步的限制，从而保证数据的正确性、有效性、完整性.
# 违反约束的不正确数据，将无法插入到表中

# 主键约束
# 特点：不可重复、唯一、非空
# 作用：用来表示数据库中的每一条记录

# ------------------------------------------------------

# 添加主键约束
#（1）建表时，添加主键约束
# 字段名 字段类型 primary key auto_increment,

# auto_increment：主键自增，字段类型必须是整数类型，默认的开始值是1

# delete 和 truncate 对自增长的影响
# delete：只是删除表中所有数据，对自增没有影响
# truncate：将整个表删除掉，然后创建一个新的表，自增的主键，重新从1开始

# 自定义主键自增的起始值
create table emp2
(
    id   int primary key auto_increment,
    name varchar(20),
    sex  char(1)
) auto_increment = 100;

#（2）建表后，插入主键约束
# alter table 表名 add primary key(主键列名);

# ------------------------------------------------------

# 删除主键约束
# alter table 表名 drop primary key;


