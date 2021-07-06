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

# 创建方式 3：接收参数插入数据，并返回受影响的行数

# 变量赋值
# set @变量名=值

# out 输出参数：表示存储过程向调用者传出值
# out 变量名 数据类型

# 向订单表插入一条数据，返回1，表示插入成功
delimiter $$
create procedure orders_proc(in o_oid int, in o_gid int, in o_price int, out out_num int)
begin
    -- 执行插入操作
    insert into orders values (o_oid, o_gid, o_price);
    -- 设置 num 的值为 1
    set @out_num = 1;
    -- 返回 out_num的值
    select @out_num;
end $$

# 调用存储过程插入数据，获取返回值
call orders_proc(1, 2, 30, @out_num);
select * from orders;

