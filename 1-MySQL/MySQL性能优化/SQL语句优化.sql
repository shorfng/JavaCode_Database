# 当只需要一条数据的时候，使用limit 1
# limit 可以停止全表扫描
select id,
       username,
       pwd,
       create_user,
       create_time,
       update_user,
       update_time,
       effective
from tb_admin_info
order by update_time
limit 1;


# 分页使用 limit m,n 尽量让m 小
# 利用主键的定位，可以减小m的值
select * from tb_admin_info where id>6 limit 2;

