# 1. 创建部门表(id,name)
# 创建部门表
create table dept
(
    id   int primary key auto_increment,
    name varchar(20)
);

insert into dept (name) values ('开发部'),('市场部'),('财务部');

# 2. 员工表，员工表(id, 姓名，性别，工资，入职日期，部门ID)
# 创建员工表
create table employee
(
    id        int primary key auto_increment,
    name      varchar(10),
    gender    char(1),   -- 性别
    salary    double,    -- 工资
    join_date date,      -- 入职日期
    dept_id   int,
    foreign key (dept_id) references dept (id) -- 外键，关联部门表(部门表的主键)
);

insert into employee(name,gender,salary,join_date,dept_id) values('孙悟空','男',7200,'2013-02-24',1);
insert into employee(name,gender,salary,join_date,dept_id) values('猪八戒','男',3600,'2010-12-02',2);
insert into employee(name,gender,salary,join_date,dept_id) values('唐僧','男',9000,'2008-08-08',2);
insert into employee(name,gender,salary,join_date,dept_id) values('白骨精','女',5000,'2015-10-07',3);
insert into employee(name,gender,salary,join_date,dept_id) values('蜘蛛精','女',4500,'2011-03-14',1);

# SQL实现

# 按要求实现下面的查询功能
# 1) 查询工资最高的员工是谁？
select * from employee where salary = (select max(salary) from employee);

# 2) 查询工资小于平均工资的员工有哪些？
select * from employee where salary < (select avg(salary) from employee);

# 3) 查询大于5000的员工，来至于哪些部门，输出部门的名字
select name from dept where id in (select dept_id from employee where salary > 5000);

# 4) 查询开发部与财务部所有的员工信息
select * from employee where dept_id in (select id from dept where name in ('开发部','财务部'));
select e.* from employee e inner join dept d on e.dept_id = d.id where d.name='开发部' or d.name='财务部';

# 5) 查询2011年以后入职的员工信息和部门信息
select *
from dept d, (select * from employee where join_date >= '2011-1-1') e
where d.id = e.dept_id;

-- 使用表连接：
select d.*, e.*
from employee e inner join dept d on e.dept_id = d.id
where e.join_date >= '2011-1-1';


# ---------------------------------------------------------------------
# 讲师表
create table teacher
(
    id     int          not null primary key,
    name   varchar(20)  not null comment '讲师姓名',
    career varchar(100) null comment '讲师简介',
    tlevel char(4)      null comment '讲师级别'
);
create index idx_name on teacher (name);

-- 向讲师表插入两条数据
insert into teacher values (1, '刘德华', '毕业于清华大学，主攻前端技术,授课风格生动活泼,深受学员喜爱', '高级讲师');
insert into teacher values (2, '郭富城', '毕业于北京大学，多年的it经验，研发多项java课题,授课经验丰富', '首席讲师');

# 课程分类表
create table subject
(
    id          int         not null primary key,
    title       varchar(10) null comment '课程分类名称',
    description varchar(60) null comment '课程分类描述',
    create_time datetime    null comment '创建时间',
    update_time datetime    null comment '更新时间'
);

-- 向课程分类表中插入数据
insert into subject values (1, '后端开发', '后端课程包括 java php python', '2020-03-27 00:44:04', '2020-03-27 00:44:04');
insert into subject values (2, '前端开发', '前端课程包括 jquery vue angularjs', '2020-02-27 10:00:04', '2020-02-27 18:44:04');

# 课程表
create table course
(
    id         int              not null primary key,
    teacher_id int              null comment '课程讲师ID（外键 用于描述课程的授课老师）',
    subject_id int              null comment '课程分类ID（外键 用于描述课程所属的分类）',
    title      varchar(50)      null comment '课程标题',
    lesson_num int(10)          null comment '总课时',
    view_count bigint(10)       null comment '浏览数量',
    cstatus    char default '0' null comment '课程状态（0默认未发布 1已发布）',
    constraint course_ibfk_1 foreign key (teacher_id) references teacher (id),
    constraint course_ibfk_2 foreign key (subject_id) references subject (id)
);

create index idx_title on course (title);
create index subject_id on course (subject_id);
create index teacher_id on course (teacher_id);

# 插入数据
insert into course values (1, 1, 1, 'java', 300, 250000, '1');
insert into course values (2, 2, 2, 'vue', 400, 200000, '1');

# 查询需求
# 查询刘德华老师所教的课程属于哪个课程分类
select * from subject where id = (select subject_id from course where teacher_id = (select id from teacher where name = '刘德华'))

