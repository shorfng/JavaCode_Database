# 2021.06.10

# 表：Logs

# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | num         | varchar |
# +-------------+---------+
# id 是这个表的主键。

# 查询结果格式如下面的例子所示：
# Logs 表：
# +----+-----+
# | Id | Num |
# +----+-----+
# | 1  | 1   |
# | 2  | 1   |
# | 3  | 1   |
# | 4  | 2   |
# | 5  | 1   |
# | 6  | 2   |
# | 7  | 2   |
# +----+-----+

-- auto-generated definition
create table test_logs
(
    id  int          not null
        primary key,
    num varchar(255) null
);

INSERT INTO td_mysql_db.test_logs (id, num) VALUES (1, '1');
INSERT INTO td_mysql_db.test_logs (id, num) VALUES (2, '1');
INSERT INTO td_mysql_db.test_logs (id, num) VALUES (3, '1');
INSERT INTO td_mysql_db.test_logs (id, num) VALUES (4, '2');
INSERT INTO td_mysql_db.test_logs (id, num) VALUES (5, '1');
INSERT INTO td_mysql_db.test_logs (id, num) VALUES (6, '2');
INSERT INTO td_mysql_db.test_logs (id, num) VALUES (7, '2');

# 编写一个 SQL 查询，查找所有至少连续出现三次的数字。返回的结果表中的数据可以按 任意顺序 排列。

# Result 表：
# +-----------------+
# | ConsecutiveNums |
# +-----------------+
# | 1               |
# +-----------------+
# 1 是唯一连续出现至少三次的数字。

# 解法1：查三次表
select distinct l1.num as ConsecutiveNums
from test_logs l1,
     test_logs l2,
     test_logs l3
where l1.id = l2.id - 1
  and l2.id = l3.id - 1
  and l1.num = l2.num
  and l2.num = l3.num;

# 解法2：变量循环标记
select distinct Num as ConsecutiveNums
from (
         select Num,
                case
                    when @prev = Num then @count := @count + 1
                    when (@prev := Num) is not null then @count := 1
                    end
                    as CNT
         from test_logs,
              (select @prev := null, @count := null) as t
     )
         as temp
where temp.CNT >= 3;

# 解法3：采取变量排序，与第二个基本一致
select b.num
from (select z.num,
             @rownum := @rownum + 1,
             if(@nums = z.num, @rank := @rank + 1, @rank := 1) as rank,
          @nums:=z.num
      from test_logs as z,
          (select @rownum := 0, @nums := null, @ rank := 0) as a
     ) as b
where b.rank >= 3;

