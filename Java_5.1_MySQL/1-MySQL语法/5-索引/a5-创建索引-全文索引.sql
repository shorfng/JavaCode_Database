# create fulltext index <索引的名字> on tablename (字段名);
# alter table tablename add fulltext [索引的名字] (字段名);
# create table tablename ( [...], fulltext key [索引的名字] (字段名) ;

# 查询全文索引
# select * from 表名 where match(全文索引名) against('全文索引字段的值');
select * from user where match(name) against('aaa');

