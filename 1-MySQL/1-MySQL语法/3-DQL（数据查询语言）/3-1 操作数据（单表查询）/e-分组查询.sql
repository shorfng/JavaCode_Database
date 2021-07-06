# 分组查询：使用 group by 语句,对查询的信息进行分组,相同数据作为一组（一般和聚合函数一起使用）
# select 分组字段/聚合函数 from 表名 group by 分组字段 [having 条件];

select sex from tb_admin_info group by sex;
select count(sex),sex from tb_admin_info group by sex;

# 在分组后，对数据进行过滤，使用关键字 having，作用类似于where条件
# 查询平均薪资大于6000的部门
# select dept_name, avg(salary)
# from emp
# where dept_name is not null
# group by dept_name
# having avg(salary) > 6000;

# ---------------------------------------------------------
#【区别】where 与 having
# where 进行分组前的过滤
# where 后面不能写聚合函数

# having 是分组后的过滤
# having 后面可以写聚合函数
