# 查看数据库版本
select version();

# 查看数据库设置的引擎
show engines;

# 查看超时时间
show variables like '%timeout%';

# 数据结构DDL操作的锁的等待时间（默认时间 8760 小时）
show variables like 'lock_wait_timeout';

# 事务锁超时时间 / innodb的DML操作的行级锁的等待时间（默认50秒）
show variables like '%innodb_lock_wait_timeout%';

# 修改超时时间
set innodb_lock_wait_timeout = 100;

# global的修改对当前线程是不生效的，只有建立新的连接才生
set global innodb_lock_wait_timeout = 100;

# 查看当前数据库设置的事务隔离级别
show variables like 'tx_isolation';

select trx_mysql_thread_id
from information_schema.innodb_trx
where trx_mysql_thread_id = connection_id();

# 查看某库某表下的数据占用（数据+索引）
select concat(round(sum(data_length / 1024 / 1024 / 1024), 2), 'GB')                  as data,
       concat(round(sum(index_length / 1024 / 1024 / 1024), 2), 'GB')                 as index_data,
       concat(round(sum((data_length + index_length) / 1024 / 1024 / 1024), 2), 'GB') as sum
from information_schema.tables
where table_schema = ''
  and table_name = '';
