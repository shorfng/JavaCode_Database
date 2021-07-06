# 查询表的所有数据
# select * from 表名;
select * from tb_admin_info;

# 查询表字段数据
# select 字段1,字段2,字段3 from 表名;
select id,username,pwd,create_user,create_time,update_user,update_time,effective from tb_admin_info;

# 别名查询
select id, username as '用户名', pwd as '密码' from tb_admin_info;

# 去重查询 distinct
select distinct username from tb_admin_info;

# 运算查询 (查询结果参与运算)
select id + 1, username from tb_admin_info;

# 获取最近的 id 值
#（1）查询和插入所使用的Connection对象必须是同一个才可以，否则返回值是不可预料的
#（2）LAST_INSERT_ID 是与table无关的，如果向表a插入数据后，再向表b插入数据，LAST_INSERT_ID返回表b中的Id值
#（3）假如你使用一条INSERT语句插入多个行，  LAST_INSERT_ID() 只返回插入的第一行数据时产生的值
#（4）假如你使用 INSERT IGNORE而记录被忽略，则AUTO_INCREMENT 计数器不会增量，而 LAST_INSERT_ID() 返回0, 这反映出没有插入任何记录。
select last_insert_id();

