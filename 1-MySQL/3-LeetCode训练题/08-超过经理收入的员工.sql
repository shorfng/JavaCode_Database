# 2021.06.22

# Employee 表包含所有员工，他们的经理也属于员工。每个员工都有一个 Id，此外还有一列对应员工的经理的 Id。
# +----+-------+--------+-----------+
# | Id | Name  | Salary | ManagerId |
# +----+-------+--------+-----------+
# | 1  | Joe   | 70000  | 3         |
# | 2  | Henry | 80000  | 4         |
# | 3  | Sam   | 60000  | NULL      |
# | 4  | Max   | 90000  | NULL      |
# +----+-------+--------+-----------+

-- auto-generated definition
create table test08_employee
(
    Id        int auto_increment
        primary key,
    Name      varchar(50) null,
    Salary    varchar(50) null,
    ManagerId varchar(50) null
);

INSERT INTO td_mysql_db.test08_employee (Id, Name, Salary, ManagerId) VALUES (1, 'Joe', '70000', '3');
INSERT INTO td_mysql_db.test08_employee (Id, Name, Salary, ManagerId) VALUES (2, 'Henry', '80000', '4');
INSERT INTO td_mysql_db.test08_employee (Id, Name, Salary, ManagerId) VALUES (3, 'Sam', '60000', null);
INSERT INTO td_mysql_db.test08_employee (Id, Name, Salary, ManagerId) VALUES (4, 'Max', '90000', null);

# 给定 Employee 表，编写一个 SQL 查询，该查询可以获取收入超过他们经理的员工的姓名。
# 在上面的表格中，Joe 是唯一一个收入超过他的经理的员工。
# +----------+
# | Employee |
# +----------+
# | Joe      |
# +----------+

select e1.name as employee
from test08_employee e1
         inner join test08_employee e2
                    on e1.managerid = e2.id
                        and e1.salary > e2.salary;

