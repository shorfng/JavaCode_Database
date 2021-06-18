#

# 表1: Person
# +-------------+---------+
# | 列名         | 类型     |
# +-------------+---------+
# | PersonId    | int     |
# | FirstName   | varchar |
# | LastName    | varchar |
# +-------------+---------+
# PersonId 是上表主键

-- auto-generated definition
create table test05_Person
(
    PersonId  int         not null
        primary key,
    FirstName varchar(50) null,
    LastName  varchar(50) null
);

# 表2: Address
# +-------------+---------+
# | 列名         | 类型    |
# +-------------+---------+
# | AddressId   | int     |
# | PersonId    | int     |
# | City        | varchar |
# | State       | varchar |
# +-------------+---------+
# AddressId 是上表主键

-- auto-generated definition
create table test05_Address
(
    AddressId int         not null
        primary key,
    PersonId  int         null,
    City      varchar(50) null,
    State     varchar(50) null
);

# 编写一个 SQL 查询，满足条件：无论 person 是否有地址信息，都需要基于上述两表提供 person 的以下信息：
# FirstName, LastName, City, State

select firstname,
       lastname,
       city,
       state
from test05_person p
         left join test05_address a
                   on p.personid = a.personid;

