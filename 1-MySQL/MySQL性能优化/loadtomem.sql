# InnoDB 数据库，进行数据预热的脚本
select distinct concat('select ', ndxcollist, ' from ', db, '.', tb, ' order by ', ndxcollist,
                       ';') selectquerytoloadcache
from (select engine,
             table_schema                                    db,
             table_name                                      tb,
             index_name,
             group_concat(column_name order by seq_in_index) ndxcollist
      from (select b.engine,
                   a.table_schema,
                   a.table_name,
                   a.index_name,
                   a.column_name,
                   a.seq_in_index
            from information_schema.statistics a
                     inner join (select engine, table_schema, table_name
                                 from information_schema.tables
                                 where engine = 'innodb') b using (table_schema, table_name)
            where b.table_schema not in ('information_schema', 'mysql')
            order by table_schema, table_name, index_name, seq_in_index) a
      group by table_schema, table_name, index_name) aa
order by db, tb;