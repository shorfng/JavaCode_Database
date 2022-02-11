# 查看当前数据库支持的引擎信息
show engines;

# 查看引擎状态信息
show engine innodb status;

# ===========================================================================

# Buffer Pool 配置参数

# 查看 page 页大小
show variables like '%innodb_page_size%';

# 查看 lru list 中 old 列表参数
show variables like '%innodb_old%';

# 查看 buffer pool 参数
# 可以设置 innodb_buffer_pool_size 为总内存大小的 60%-80%
# 可以设置 innodb_buffer_pool_instances 为多个，这样可以避免缓存争夺
show variables like '%innodb_buffer%';


# ===========================================================================


# 查看 Log Buffer 日志缓冲区 的信息
show variables like '%innodb_log%';

# innodb_flush_log_at_trx_commit 参数控制日志刷新行为，默认为1
# 0：每隔1秒写日志文件和刷盘操作（写日志文件LogBuffer-->OS cache，刷盘OS cache-->磁盘文件），最多丢失1秒数据
# 1：事务提交，立刻写日志文件和刷盘，数据不丢失，但是会频繁IO操作
# 2：事务提交，立刻写日志文件，每隔1秒钟进行刷盘操作
show variables like '%innodb_flush_log%';


# ===========================================================================

# 表空间

# 系统表空间参数
# 默认值 ibdata1:12M:autoextend（文件名为ibdata1、12MB、自动扩展）
show variables like '%innodb_data_file_path%';


# 独立表空间
show variables like '%innodb_file_per_table%';


# 通用表空间
# 创建表空间 ts1
create tablespace ts1 add datafile 'ts1.ibd' engine=innodb;
# 将表添加到 ts1 表空间
create table t1 (c1 int primary key) tablespace ts1;


# 撤销表空间
# 参数值=0表示使用系统表空间ibdata1
# 参数值>0表示使用undo表空间undo_001、undo_002等
show variables like '%innodb_undo_tablespaces%';


# ===========================================================================

# InnoDB Data Dictionary（数据字典）

# 默认情况下启用双写缓冲区，要禁用 Doublewrite 缓冲区，可以将 innodb_doublewrite 设置为0
show variables like '%innodb_doublewrite%';

# 使用 Doublewrite 缓冲区时建议将 innodb_flflush_method 设置为 O_DIRECT
show variables like '%innodb_flush_method%';


# ===========================================================================
# InnoDB 线程模型


# Purge Thread
show variables like '%innodb_purge_threads%';


# Page Cleaner Thread
show variables like '%innodb_page_cleaners%';


# Master Thread
# 脏页比例达到多少
show variables like '%innodb_max_dirty_pages_pct%';
# 每次执行刷多少页
show variables like '%innodb_io_capacity%';
# 每次删除多少无用的 undo 页
show variables like '%innodb_purge_batch_size%';


# ===========================================================================
# ibd 文件存储格式


# 关注 Row_format 列
# 如果 row_format 为 REDUNDANT、COMPACT，文件格式为 Antelope
# 如果 row_format 为 DYNAMIC、COMPRESSED，文件格式为 Barracuda
show table status;

# 关注 Row_format 列
# 关注 File_Format 列
select * from information_schema.innodb_sys_tables;



# 查看文件格式（File_Format）
show variables like '%innodb_file_format%';


# DYNAMIC 行格式
show variables like '%innodb_large_prefix%';


# ===========================================================================


# Undo log 存储信息
show variables like '%innodb_undo%';


# ===========================================================================
# Redo Log 存储信息
# 每个InnoDB存储引擎至少有1个重做日志文件组（group），每个文件组至少有2个重做日志文件，默认为 ib_logfile0 和 ib_logfile1
show variables like '%innodb_log%';


# Redo Buffer 持久化到 Redo Log 的策略
# 0：每秒提交 Redo buffer ->OS cache -> flush cache to disk，可能丢失一秒内的事务数据，由后台Master线程每隔 1秒执行一次操作
# 1：（默认值），每次事务提交执行 Redo Buffer -> OS cache -> flush cache to disk，最安全，性能最差的方式
# 2：每次事务提交执行 Redo Buffer -> OS cache，然后由后台Master线程再每隔1秒执行OS cache -> flush cache to disk 的操作
# 一般建议选择取值2，因为 MySQL 挂了数据没有损失，整个服务器挂了才会损失1秒的事务提交数据
show variables like '%Innodb_flush_log_at_trx_commit%';


# ===========================================================================


# Binlog 状态查看
show variables like '%log_bin%';

# 开启 Binlog
set global log_bin=mysqllogbin;



# 查看 Binlog
# 方式1：使用 show binlog events 命令
# 等价于show master logs;
show binary logs;

show master status;
show binlog events;
show binlog events in 'mysqlbinlog.000001';


# 方式2：使用 mysqlbinlog 命令（切换到安装目录下的data目录，然后在命令行中执行）
# 直接在命令行查看
# mysqlbinlog "文件名"

# 输出到文件中查看
# mysqlbinlog "文件名" > "test.sql"



# 删除 Binlog 文件
# 删除指定文件
purge binary logs to 'mysqlbinlog.000001';

# 删除指定时间之前的文件
purge binary logs before '2020-04-28 00:00:00';

# 清除所有文件
reset master;

# 启动自动清理功能
# 默认值为0表示没启用
# 设置为1表示超出1天binlog文件会自动删除掉
show variables like '%expire_logs_days%';

