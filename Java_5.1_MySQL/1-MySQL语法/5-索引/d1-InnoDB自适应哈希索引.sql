# 开启
set global innodb_adaptive_hash_index=1;

# 关闭
set global innodb_adaptive_hash_index=0;

# 查看自适应哈希索引的信息（关注 innodb_adaptive_hash_index 的值）
show variables like '%innodb_adaptive%';






