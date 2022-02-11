# 唯一约束
# 特点：表中的某一列的值不能重复(对 null 不做唯一的判断)

# 语法格式
# 字段名 字段类型 unique

# 添加唯一约束
create table emp3
(
    id   int primary key auto_increment,
    name varchar(20) unique,
    sex  char(1)
);

#【区别】主键约束与唯一约束
# 主键约束，唯一且不能够为空
# 唯一约束，唯一但是可以为空
# 一个表中只能有一个主键，但是可以有多个唯一约束

