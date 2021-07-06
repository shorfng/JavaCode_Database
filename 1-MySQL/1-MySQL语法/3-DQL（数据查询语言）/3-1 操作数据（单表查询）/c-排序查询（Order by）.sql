# 排序
# asc：升序（默认，可以省略不写）
# desc：降序

# 1、单列排序：只按照某一个字段进行排序
# select 字段1, 字段2 from 表名1, 表名2 order by 字段1, 字段2;
select * from tb_admin_info order by username ;

# select 字段1, 字段2 from 表名1, 表名2 order by 字段1, 字段2 asc;
select * from tb_admin_info order by username asc ;

# select 字段1, 字段2 from 表名1, 表名2 order by 字段1, 字段2 desc;
select * from tb_admin_info order by username desc ;

# 2、组合排序：同时对多个字段进行排序, 如果第一个字段相同 就按照第二个字段进行排序,以此类推
select * from tb_admin_info order by username desc, id desc ;

# ---------------------------------------------------------------------------------

#【待验证】拼音排序：如果字符集采用的是 gbk(汉字编码字符集)，直接在查询语句后边添加 ORDER BY
select * from tb_admin_info order by username desc ;

#【待验证】拼音排序：如果字符集采用的是 utf8(万国码)，需要先对字段进行转码然后排序
select * from tb_admin_info order by CONVERT(username using gbk) desc ;

