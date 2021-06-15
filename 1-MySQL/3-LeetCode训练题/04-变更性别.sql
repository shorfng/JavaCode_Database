# 2021.06.15

# 给定一个 salary 表，如下所示，有 m = 男性 和 f = 女性 的值。交换所有的 f 和 m 值（例如，将所有 f 值更改为 m，反之亦然）。
# 要求只使用一个更新（Update）语句，并且没有中间的临时表。
# 注意，您必只能写一个 Update 语句，请不要编写任何 Select 语句。

# 例如：
# | id | name | sex | salary |
# |----|------|-----|--------|
# | 1  | A    | m   | 2500   |
# | 2  | B    | f   | 1500   |
# | 3  | C    | m   | 5500   |
# | 4  | D    | f   | 500    |

-- auto-generated definition
create table test_salary
(
    id     int auto_increment
        primary key,
    name   varchar(255) null,
    sex    varchar(255) null comment 'm男性，f女性',
    salary varchar(255) null
);

INSERT INTO td_mysql_db.test_salary (id, name, sex, salary) VALUES (1, 'A', 'm', '2500');
INSERT INTO td_mysql_db.test_salary (id, name, sex, salary) VALUES (2, 'B', 'f', '1500');
INSERT INTO td_mysql_db.test_salary (id, name, sex, salary) VALUES (3, 'C', 'm', '5500');
INSERT INTO td_mysql_db.test_salary (id, name, sex, salary) VALUES (4, 'D', 'f', '500');

# 运行你所编写的更新语句之后，将会得到以下表:
# | id | name | sex | salary |
# |----|------|-----|--------|
# | 1  | A    | f   | 2500   |
# | 2  | B    | m   | 1500   |
# | 3  | C    | f   | 5500   |
# | 4  | D    | m   | 500    |

# 答案
update test_salary set sex = if(sex = 'm', 'f', 'm');

# 查看
select * from test_salary;