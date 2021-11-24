# =================== select_type 表示查询的类型 =====================================
# simple：表示查询语句不包含子查询或union
explain select * from tb_admin_info where id < 3;

# primary：表示此查询是最外层的查询

# union：表示此查询是union的第二个或后续的查询
explain select * from tb_admin_info where id = 1 union select * from tb_admin_info where id = 2;

# dependent union：union中的第二个或后续的查询语句，使用了外面查询结果

# union result：union的结果

# subquery：select子查询语句
explain select * from tb_admin_info where id =(select max(id) from tb_admin_info);

# dependent subquery：select子查询语句依赖外层查询的结果
explain select * from tb_admin_info t1 where id =(select max(t2.id) from tb_admin_info t2 where t1.pwd = '2');

