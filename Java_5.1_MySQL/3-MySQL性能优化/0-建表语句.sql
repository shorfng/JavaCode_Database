# 慢查询日志
create table slow
(
    id   int primary key auto_increment,
    name varchar(20)
) engine = innodb
  charset = utf8;

INSERT INTO `JavaCode_Database`.slow (id, name) VALUES (1, 'java');
INSERT INTO `JavaCode_Database`.slow (id, name) VALUES (2, 'h5');
INSERT INTO `JavaCode_Database`.slow (id, name) VALUES (3, 'ui');
INSERT INTO `JavaCode_Database`.slow (id, name) VALUES (4, 'big');

insert into slow(name) select name from slow;

# ==================================================================

create table student
(
    id   int primary key auto_increment,
    name varchar(20),
    sex  char(1),
    age  int
) engine = innodb
  charset = utf8;

INSERT INTO `JavaCode_Database`.student (id, name, sex, age) VALUES (1, 'axx', 'M', 18);
INSERT INTO `JavaCode_Database`.student (id, name, sex, age) VALUES (2, 'bxx', 'M', 18);
INSERT INTO `JavaCode_Database`.student (id, name, sex, age) VALUES (3, 'cxx', 'M', 18);
INSERT INTO `JavaCode_Database`.student (id, name, sex, age) VALUES (4, 'dxx', 'M', 19);
INSERT INTO `JavaCode_Database`.student (id, name, sex, age) VALUES (5, 'exx', 'F', 20);

insert into student(name,sex,age) select name,sex,age from student;



