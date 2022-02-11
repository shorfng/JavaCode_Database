# 2021.06.30

# 编写一个 SQL 查询，获取 Employee 表中第二高的薪水（Salary）
# +----+--------+
# | Id | Salary |
# +----+--------+
# | 1  | 100    |
# | 2  | 200    |
# | 3  | 300    |
# +----+--------+

-- auto-generated definition
create table test13_Employee
(
    Id     int auto_increment
        primary key,
    Salary int null
);

INSERT INTO td_mysql_db.test13_Employee (Id, Salary) VALUES (1, 100);
INSERT INTO td_mysql_db.test13_Employee (Id, Salary) VALUES (2, 300);
INSERT INTO td_mysql_db.test13_Employee (Id, Salary) VALUES (3, 200);

# 例如上述 Employee 表，SQL查询应该返回 200 作为第二高的薪水。如果不存在第二高的薪水，那么查询应返回 null。
# +---------------------+
# | SecondHighestSalary |
# +---------------------+
# | 200                 |
# +---------------------+

select (select distinct salary
        from test13_employee
        order by salary desc
        limit 1, 1) secondhighestsalary;


