# 查看所有触发器信息
show triggers ;

# 在 triggers 表中查看部分触发器信息
# select * from information_schema.triggers where trigger_name= '触发器名';
select * from information_schema.triggers where trigger_name = 't1';


