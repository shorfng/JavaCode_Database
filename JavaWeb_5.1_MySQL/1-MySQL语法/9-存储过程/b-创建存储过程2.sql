# 数据准备

# 商品表
create table goods
(
    gid  int,
    name varchar(20),
    num  int -- 库存
);

# 订单表
create table orders
(
    oid   int,
    gid   int,
    price int -- 订单价格
);

# 向商品表中添加3条数据
insert into goods values (1, '奶茶', 20);
insert into goods values (2, '绿茶', 100);
insert into goods values (3, '花茶', 25);

# ------------------------------------------------------------

# 创建方式 2：创建接收参数的存储过程
# in 输入参数：表示调用者向存储过程传入值
# create procedure 存储过程名称(in 参数名 参数类型)

# 接收一个商品id, 根据id删除数据
delimiter $$
create procedure goods_proc02(in goods_id int)
begin
    delete from goods where gid = goods_id;
end $$

# 调用存储过程，传递参数
# 删除 id 为2的商品
call goods_proc02(2);
