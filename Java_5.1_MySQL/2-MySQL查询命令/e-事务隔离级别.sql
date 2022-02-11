# 查看MySQL当前数据库的事务隔离级别（默认是 Repeatable Read）
show variables like 'tx_isolation';
select @@tx_isolation;

# 设置事务隔离级别
set tx_isolation = 'READ-UNCOMMITTED';
set tx_isolation = 'READ-COMMITTED';
set tx_isolation = 'REPEATABLE-READ';
set tx_isolation = 'SERIALIZABLE';

# 设置当前 mysql连接会话的事务隔离级别，并不是永久改变的
set session transaction isolation level read uncommitted;
set session transaction isolation level read committed;
set session transaction isolation level repeatable read;
set session transaction isolation level serializable;
