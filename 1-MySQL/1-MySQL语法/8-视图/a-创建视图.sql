# 参数解析
# view：表示视图
# 视图名称在数据库中必须是唯一的，不能与其他表或视图同名
# column_list：可选参数，表示属性清单，指定视图中各个属性的名称，默认情况下，与SELECT语句中查询 的属性相同
# as：表示视图要执行的操作
# select语句：向视图提供数据内容

# 格式
# create view 视图名 [column_list] as select语句;

create view products_category_view as
select *
from products p
         left join category c on p.`category_id` = c.`cid`;


