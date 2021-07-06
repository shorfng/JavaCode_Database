# union 左右两边的列的数量要一样，一般是两个表有相同的列
# all: 可选，返回所有结果集，包含重复数据
# distinct: 可选，删除结果集中重复的数据（默认情况下 union 操作符已经删除了重复数据，所以 distinct 修饰符对结果没影响）
# select 字段1, 字段2 from 表1 where 条件1 = '' union/all/distinct select 字段1, 字段2 from 表2 where 条件2 = '';

# union 语句：用于将不同表中相同列中查询的数据展示出来（不包括重复数据）
# select 列名称 from 表名称 union select 列名称 from 表名称 order by 列名称;
select id, username, pwd from tb_admin_info union select id, username, pwd from tb_admin_info order by username;
select id, username, pwd from tb_admin_info union select id, username, pwd from tb_admin_info order by username;

# union all 语句：用于将不同表中相同列中查询的数据展示出来（包括重复数据）
# select 列名称 from 表名称 union all select 列名称 from 表名称 order by 列名称;
select id, username, pwd from tb_admin_info union all select id, username, pwd from tb_admin_info order by username;

