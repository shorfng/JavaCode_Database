# 左外连接的特点
# 以左表为基准，匹配右边表中的数据，如果匹配的上，就展示匹配到的数据
# 如果匹配不到，左表中的数据正常展示，右边的展示为null

# 使用 left outer join（outer 可以省略）
# select 字段名 from 左表 left outer join 右表 on 条件;
# select * from category c left join products p on c.`cid`= p.`category_id`;

# -------------------------------------------------------------------

# 右外连接的特点
# 以右表为基准，匹配左边表中的数据，如果能匹配到，展示匹配到的数据
# 如果匹配不到，右表中的数据正常展示，左边展示为null

# 使用 right outer join（outer 可以省略）
# select 字段名 from 左表 right outer join 右表 on 条件;
# select * from products p right join category c on p.`category_id` = c.`cid`;

# -------------------------------------------------------------------

# 内连接：inner join，只获取两张表中，交集部分的数据.
# 左外连接：left join，以左表为基准，查询左表的所有数据，以及与右表有交集的部分
# 右外连接：right join，以右表为基准，查询右表的所有的数据，以及与左表有交集的部分
