# 创建触发器

delimiter $
# 触发器名，在一个数据库中触发器名是唯一的
create trigger trigger_name
    # 触发的时机             监视的事件
    before / after    insert / update / delete
    # 触发器所在的表
    on table_name
    # 行触发器（固定写法，每一行受影响，触发事件都执行）
    for each row
begin
    # 触发事件
end $

# --------------------------------------------------
# 举例

# 数据准备
# 商品表
create table goods
(
    gid  int,
    name varchar(20),
    num  int -- 库存
);

# 向商品中添加一条数据
insert into goods values(1,'book',40);

# 创建触发器：在下订单的时候，对应的商品的库存量要相应的减少，卖出商品之后减少库存量
delimiter $
# 创建触发器
create trigger t1
    # 指定触发的时机,和要监听的表
    after insert
    # 触发器所在的表
    on orders
    # 行触发器
    for each row
begin
    # 触发后具体要执行的事件：订单+1 库存-1
    update goods set num = num - 1 where gid = 1;
end$


