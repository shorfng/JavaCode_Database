# 2021.06.29

# Employee 表包含所有员工信息，每个员工有其对应的 Id, salary 和 department Id。
# +----+-------+--------+--------------+
# | Id | Name  | Salary | DepartmentId |
# +----+-------+--------+--------------+
# | 1  | Joe   | 70000  | 1            |
# | 2  | Jim   | 90000  | 1            |
# | 3  | Henry | 80000  | 2            |
# | 4  | Sam   | 60000  | 2            |
# | 5  | Max   | 90000  | 1            |
# +----+-------+--------+--------------+

-- auto-generated definition
create table test12_Employee
(
    Id           int auto_increment
        primary key,
    Name         varchar(50) null,
    Salary       varchar(50) null,
    DepartmentId int         null
);

INSERT INTO td_mysql_db.test12_Employee (Id, Name, Salary, DepartmentId) VALUES (1, 'Joe', '70000', 1);
INSERT INTO td_mysql_db.test12_Employee (Id, Name, Salary, DepartmentId) VALUES (2, 'Jim', '90000', 1);
INSERT INTO td_mysql_db.test12_Employee (Id, Name, Salary, DepartmentId) VALUES (3, 'Henry', '80000', 2);
INSERT INTO td_mysql_db.test12_Employee (Id, Name, Salary, DepartmentId) VALUES (4, 'Sam', '60000', 2);
INSERT INTO td_mysql_db.test12_Employee (Id, Name, Salary, DepartmentId) VALUES (5, 'Max', '90000', 1);

# Department 表包含公司所有部门的信息。
# +----+----------+
# | Id | Name     |
# +----+----------+
# | 1  | IT       |
# | 2  | Sales    |
# +----+----------+

-- auto-generated definition
create table test12_Department
(
    Id   int auto_increment
        primary key,
    Name varchar(50) null
);

INSERT INTO td_mysql_db.test12_Department (Id, Name) VALUES (1, 'IT');
INSERT INTO td_mysql_db.test12_Department (Id, Name) VALUES (2, 'Sales');

# 编写一个 SQL 查询，找出每个部门工资最高的员工。对于上述表，您的 SQL 查询应返回以下行（行的顺序无关紧要）。
# +------------+----------+--------+
# | Department | Employee | Salary |
# +------------+----------+--------+
# | IT         | Max      | 90000  |
# | IT         | Jim      | 90000  |
# | Sales      | Henry    | 80000  |
# +------------+----------+--------+

# 解释：
# Max 和 Jim 在 IT 部门的工资都是最高的，Henry 在销售部的工资最高。

select d.name department,
       e.name employee,
       e.salary
from test12_employee e,
     test12_department d,
     (select departmentid, max(salary) salary
      from test12_employee
      group by departmentid) m
where e.departmentid = d.id
  and e.departmentid = m.departmentid
  and e.salary = m.salary;

