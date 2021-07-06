# 修改表名
# rename table 旧表名 to 新表名
rename table tb_admin_info to tb_admin_info_new;
rename table tb_admin_info_new to tb_admin_info;

# 修改表的字符集
# alter table 表名 character set 字符集;
alter table tb_admin_info character set gbk;

# 修改表注释
alter table tb_admin_info comment '管理员表';

# ------------------------------------------------------------------------

# 向表中添加列
# alter table 表名 add 字段名称 字段类型;
alter table tb_admin_info add flag varchar(20);

# 修改列类型（不带注释就会修改为无注释）
# alter table 表名 modify 字段名称 字段类型
alter table tb_admin_info modify column pwd bigint;

# 修改列名称
# alter table 表名 change 旧列名 新列名 类型(长度);
alter table tb_admin_info change flag flag_new varchar(20);

# 修改列注释
alter table tb_admin_info modify column username varchar(100) comment '用户名';

# ------------------------------------------------------------------------

# 删除列
# alter table 表名 drop 列名;
alter table tb_admin_info drop flag_new;
