-- 清空并删除分区
alter table tb_admin_info_partition_list drop partition P00000000003;

-- 清空分区
alter table tb_admin_info_partition_range truncate partition P20230103;
