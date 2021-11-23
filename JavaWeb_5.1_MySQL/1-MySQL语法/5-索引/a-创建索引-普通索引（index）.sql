# 普通索引 (index)
# 加快对数据的访问速度
# 最经常出现在查询条件（where column=）或排序条件（orderby column）中的数据列创建索引

# ------------------------------------------------------

# 方式1：使用create index 语句创建，在已有的表上创建索引
# create index 索引名 on 表名(列名[长度])
create index username on tb_admin_info(username);

# 方式2：修改表结构添加索引
# alter table 表名 add index 索引名 (列名);
alter table tb_admin_info add index username (username);
alter table tb_admin_info add index (pwd);




