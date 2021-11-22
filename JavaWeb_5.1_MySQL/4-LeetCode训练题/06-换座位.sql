# 2021.06.19

# 小美是一所中学的信息科技老师，她有一张 seat 座位表，平时用来储存学生名字和与他们相对应的座位 id。
# 其中纵列的id是连续递增的
# 小美想改变相邻俩学生的座位。
# 你能不能帮她写一个 SQL query来输出小美想要的结果呢？

# 示例：
# +---------+---------+
# |    id   | student |
# +---------+---------+
# |    1    | Abbot   |
# |    2    | Doris   |
# |    3    | Emerson |
# |    4    | Green   |
# |    5    | Jeames  |
# +---------+---------+

-- auto-generated definition
create table test06_seat
(
    id      int auto_increment
        primary key,
    student varchar(50) null
);

INSERT INTO td_mysql_db.test06_seat (id, student) VALUES (1, 'Abbot');
INSERT INTO td_mysql_db.test06_seat (id, student) VALUES (2, 'Doris');
INSERT INTO td_mysql_db.test06_seat (id, student) VALUES (3, 'Emerson');
INSERT INTO td_mysql_db.test06_seat (id, student) VALUES (4, 'Green');
INSERT INTO td_mysql_db.test06_seat (id, student) VALUES (5, 'Jeames');

# 假如数据输入的是上表，则输出结果如下：
# +---------+---------+
# |    id   | student |
# +---------+---------+
# |    1    | Doris   |
# |    2    | Abbot   |
# |    3    | Green   |
# |    4    | Emerson |
# |    5    | Jeames  |
# +---------+---------+

# 注意：
# 如果学生人数是奇数，则不需要改变最后一个同学的座位

## 处理偶数 id，让 id 减 1
## 例如 2,4,6,... 变成 1,3,5,...
SELECT s1.id - 1 AS id,
       s1.student
FROM test06_seat s1
WHERE s1.id MOD 2 = 0
UNION
## 处理奇数 id，让 id 加 1。但是如果最大的 id 为奇数，则不做处理
## 例如 1,3,5,... 变成 2,4,6,...
SELECT s2.id + 1 AS id,
       s2.student
FROM test06_seat s2
WHERE s2.id MOD 2 = 1
  AND s2.id != (SELECT max(s3.id) FROM test06_seat s3)
UNION
## 如果最大的 id 为奇数，单独取出这个数
SELECT s4.id AS id,
       s4.student
FROM test06_seat s4
WHERE s4.id MOD 2 = 1
  AND s4.id = (SELECT max(s5.id) FROM test06_seat s5)
ORDER BY id;
