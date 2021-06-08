# 2021.06.08

# 编写一个 SQL 查询，来删除 Person 表中所有重复的电子邮箱，重复的邮箱里只保留 Id 最小的那个。
# Id 是这个表的主键。

# +----+------------------+
# | Id | Email            |
# +----+------------------+
# | 1  | john@example.com |
# | 2  | bob@example.com  |
# | 3  | john@example.com |
# +----+------------------+

-- auto-generated definition
create table test_person
(
    id    int          not null,
    email varchar(255) null,
    constraint test_person_id_uindex
        unique (id)
);

alter table test_person
    add primary key (id);

INSERT INTO td_mysql_db.test_person (id, email) VALUES (1, 'john@example.com');
INSERT INTO td_mysql_db.test_person (id, email) VALUES (2, 'bob@example.com');
INSERT INTO td_mysql_db.test_person (id, email) VALUES (3, 'john@example.com');

# 例如，在运行你的查询语句之后，上面的 Person 表应返回以下几行:

# +----+------------------+
# | Id | Email            |
# +----+------------------+
# | 1  | john@example.com |
# | 2  | bob@example.com  |
# +----+------------------+

# 提示：
# 执行 SQL 之后，输出是整个 Person 表。
# 使用 delete 语句。


# 答案
delete p1
from test_person p1,
     test_person p2
where p1.email = p2.email
  and p1.id > p2.id;

select * from test_person;