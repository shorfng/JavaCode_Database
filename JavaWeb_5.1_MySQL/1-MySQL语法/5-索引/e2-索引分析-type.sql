# =================== type 表示存储引擎查询数据时采用的方式 =====================================
desc t_user;
desc tb_admin_info;


# all：表示全表扫描，性能最差
explain select * from t_user;
explain select * from t_user where sex = 1;

# index：表示基于索引的全表扫描，先扫描索引再扫描全表数据
explain select * from t_user where sex = 1 order by id;   # id 有索引，因此 type = index
explain select * from t_user where sex = 1 order by sex;  # sex 没有索引，因此 type = all

# range：表示使用索引范围查询。使用>、>=、<、<=、in等等
explain select * from t_user where id > 1;   # id 有索引，因此 type = range
explain select * from t_user where sex > 1;  # sex 没有索引，因此 type = all

# ref：表示使用非唯一索引进行单值查询
create index age on t_user (age);  # 创建非唯一索引
explain select * from t_user where age = 22;  # 使用非唯一索引进行单值查询（查询结果唯一，type = ref）
explain select * from t_user where age = 18;  # 使用非唯一索引进行单值查询（查询结果不唯一，type = all）

create index sex on tb_admin_info (sex);  # 创建非唯一索引
explain select * from tb_admin_info where sex = 1;  # 使用非唯一索引进行单值查询（查询结果唯一，type = ref）
explain select * from tb_admin_info where sex = 2;  # 使用非唯一索引进行单值查询（查询结果不唯一，type = all）

# eq_ref：一般情况下出现在多表join查询，表示前面表的每一个记录，都只能匹配后面表的一行结果。
# t_user表 all
# t_score表 eq_ref
explain select * from t_user u,t_score s where u.id = s.user_id;

# const：表示使用主键或唯一索引做等值查询，常量查询
explain select * from t_user where id = 1;  # 使用主键或唯一索引做等值查询，常量查询

# null：表示不用访问表，速度最快
explain select now();

