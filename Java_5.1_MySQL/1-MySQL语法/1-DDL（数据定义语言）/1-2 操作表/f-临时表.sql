# 临时表
# 创建临时表 - 通过查询其他表
# create temporary table 临时表名 as (select *  from 旧的表名 limit 0,10000);
create temporary table temp_tb_admin_info as (select *  from tb_admin_info limit 0,10000);

# 查询临时表
select * from temp_tb_admin_info;

# 删除临时表
drop table temp_tb_admin_info;
