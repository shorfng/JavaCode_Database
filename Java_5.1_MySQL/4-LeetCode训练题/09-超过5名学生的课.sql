# 2021.06.23

# 有一个 courses 表 ，有: student(学生) 和 class (课程)。
# 请列出所有超过或等于5名学生的课。

# 例如，表：
# +---------+------------+
# | student | class      |
# +---------+------------+
# | A       | Math       |
# | B       | English    |
# | C       | Math       |
# | D       | Biology    |
# | E       | Math       |
# | F       | Computer   |
# | G       | Math       |
# | H       | Math       |
# | I       | Math       |
# +---------+------------+

-- auto-generated definition
create table test09_courses
(
    student varchar(50) null,
    class   varchar(50) null
);

INSERT INTO td_mysql_db.test09_courses (student, class) VALUES ('A', 'Math');
INSERT INTO td_mysql_db.test09_courses (student, class) VALUES ('B', 'English');
INSERT INTO td_mysql_db.test09_courses (student, class) VALUES ('C', 'Math');
INSERT INTO td_mysql_db.test09_courses (student, class) VALUES ('D', 'Biology');
INSERT INTO td_mysql_db.test09_courses (student, class) VALUES ('E', 'Math');
INSERT INTO td_mysql_db.test09_courses (student, class) VALUES ('F', 'Computer');
INSERT INTO td_mysql_db.test09_courses (student, class) VALUES ('G', 'Math');
INSERT INTO td_mysql_db.test09_courses (student, class) VALUES ('H', 'Math');
INSERT INTO td_mysql_db.test09_courses (student, class) VALUES ('I', 'Math');

# 应该输出:
# +---------+
# | class   |
# +---------+
# | Math    |
# +---------+

# 提示：学生在每个课中不应被重复计算。

select class
from test09_courses
group by class
having count(distinct student) >= 5;