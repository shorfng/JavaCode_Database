# =============================== 表级锁 ====================================

# 手动增加表锁
# lock table 表名称 read|write,表名称2 read|write;
lock table t_score read, t_user write;

# 查看表上加过的锁
show open tables;

# 删除表锁
unlock tables;

# =============================== 死锁 ====================================

# 查看近期死锁日志信息，使用 explain 查看下SQL执行计划
show engine innodb status;

# 检查锁的状态变量（如果等待次数高，而且每次等待时间长，需要分析系统中为什么会有如此多的等待，然后着手定制优化）
# Innodb_row_lock_current_waits：当前正在等待锁的数量
# Innodb_row_lock_time：从系统启动到现在锁定总时间长度
# Innodb_row_lock_time_avg： 每次等待锁的平均时间
# Innodb_row_lock_time_max：从系统启动到现在等待最长的一次锁的时间
# Innodb_row_lock_waits：系统启动后到现在总共等待的次数
show status like 'innodb_row_lock%';

