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

# 创建方式 1：简单存储过程
-- 声明语句结束符，可以自定义 一般使用$$
delimiter $$
-- 声明存储过程
create procedure 过程名称()
-- 开始编写存储过程
begin
    -- 要执行的操作
-- 存储过程结束
end $$

# 例子
# 查询所有商品数据
delimiter $$
create procedure goods_proc()
begin
    select * from goods;
end $$

# 调用存储过程
# call 存储过程名

# 查询goods表所有数据
call goods_proc;

