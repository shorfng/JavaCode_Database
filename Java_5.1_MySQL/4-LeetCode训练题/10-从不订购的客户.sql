# 2021.06.24

# 某网站包含两个表，Customers 表和 Orders 表。编写一个 SQL 查询，找出所有从不订购任何东西的客户。
#
# Customers 表：
# +----+-------+
# | Id | Name  |
# +----+-------+
# | 1  | Joe   |
# | 2  | Henry |
# | 3  | Sam   |
# | 4  | Max   |
# +----+-------+

-- auto-generated definition
create table test10_customers
(
    Id   int auto_increment
        primary key,
    Name varchar(50) null
);

INSERT INTO td_mysql_db.test10_customers (Id, Name) VALUES (1, 'Joe');
INSERT INTO td_mysql_db.test10_customers (Id, Name) VALUES (2, 'Henry');
INSERT INTO td_mysql_db.test10_customers (Id, Name) VALUES (3, 'Sam');
INSERT INTO td_mysql_db.test10_customers (Id, Name) VALUES (4, 'Max');

# Orders 表：
# +----+------------+
# | Id | CustomerId |
# +----+------------+
# | 1  | 3          |
# | 2  | 1          |
# +----+------------+

-- auto-generated definition
create table test10_orders
(
    Id         int auto_increment
        primary key,
    CustomerId int null
);

INSERT INTO td_mysql_db.test10_orders (Id, CustomerId) VALUES (1, 3);
INSERT INTO td_mysql_db.test10_orders (Id, CustomerId) VALUES (2, 1);

# 例如给定上述表格，你的查询应返回：
# +-----------+
# | Customers |
# +-----------+
# | Henry     |
# | Max       |
# +-----------+

# 答案
select a.Name as Customers
from test10_customers a
where a.Id not in (select b.CustomerId from test10_orders b where b.CustomerId = a.Id)
