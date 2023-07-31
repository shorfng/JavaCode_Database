# 2021.07.01

# 编写一个 SQL 查询，获取 Employee 表中第 n 高的薪水（Salary）。

# +----+--------+
# | Id | Salary |
# +----+--------+
# | 1  | 100    |
# | 2  | 200    |
# | 3  | 300    |
# +----+--------+

-- auto-generated definition
create table test14_Employee
(
    Id     int auto_increment
        primary key,
    Salary int null
);

INSERT INTO td_mysql_db.test14_Employee (Id, Salary) VALUES (1, 100);
INSERT INTO td_mysql_db.test14_Employee (Id, Salary) VALUES (2, 200);
INSERT INTO td_mysql_db.test14_Employee (Id, Salary) VALUES (3, 300);

# 例如上述 Employee 表，n = 2 时，应返回第二高的薪水 200。如果不存在第 n 高的薪水，那么查询应返回 null。
# +------------------------+
# | getNthHighestSalary(2) |
# +------------------------+
# | 200                    |
# +------------------------+

create function getnthhighestsalary(n int) returns int
begin

    set n = n - 1;
    return (
        select (
                   select distinct salary
                   from test14_Employee
                   order by salary desc
                   limit n, 1
               )
    );

end

# 调用
select getnthhighestsalary(2);