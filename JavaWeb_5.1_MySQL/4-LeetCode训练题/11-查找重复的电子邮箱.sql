# 2021.06.25、2021.06.28

# 编写一个 SQL 查询，查找 Person 表中所有重复的电子邮箱。
# +----+---------+
# | Id | Email   |
# +----+---------+
# | 1  | a@b.com |
# | 2  | c@d.com |
# | 3  | a@b.com |
# +----+---------+

-- auto-generated definition
create table test11_person
(
    Id    int auto_increment
        primary key,
    Email varchar(50) null
);

INSERT INTO td_mysql_db.test11_person (Id, Email) VALUES (1, 'a@b.com');
INSERT INTO td_mysql_db.test11_person (Id, Email) VALUES (2, 'c@d.com');
INSERT INTO td_mysql_db.test11_person (Id, Email) VALUES (3, 'a@b.com');

# 根据以上输入，你的查询应返回以下结果：
# +---------+
# | Email   |
# +---------+
# | a@b.com |
# +---------+
# 说明：所有电子邮箱都是小写字母。

# 答案
select email
from test11_person
group by email
having count(*) >= 2;