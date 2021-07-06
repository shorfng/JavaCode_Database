# 外键：在从表中与主表的主键对应的那个字段
# 优点：外键约束可以让两张表之间产生一个对应关系，从而保证主从表的引用的完整性

# 创建外键约束
# （1）新建表时添加外键
# constraint 外键约束名称 foreign key(外键字段名) references 主表名(主键字段名)

# （2）已有表添加外键
# alter table 从表 add constraint 外键约束名称 foreign key(外键字段名) references 主表(主键字段名);

# 删除外键约束
# alter table 从表 drop foreign key 外键约束名称;


# 注意事项
# 从表外键类型必须与主表主键类型一致，否则创建失败
# 添加数据时，应该先添加主表中的数据
# 删除数据时，应该先删除从表中的数据


