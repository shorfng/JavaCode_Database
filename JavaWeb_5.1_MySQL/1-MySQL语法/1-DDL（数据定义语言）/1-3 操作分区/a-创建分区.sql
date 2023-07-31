-- 创建分区

CREATE TABLE IF NOT EXISTS `tb_admin_info_partition_list`
(
    `id`          INT AUTO_INCREMENT COMMENT '序号',
    `username`    VARCHAR(20) NOT NULL COMMENT '登录账户',
    `pwd`         VARCHAR(20) NOT NULL COMMENT '密码',
    `sex`         VARCHAR(20)  COMMENT '性别',
    `create_user` VARCHAR(20) COMMENT '创建人',
    `create_time` DATE COMMENT '创建时间',
    `update_user` VARCHAR(20) COMMENT '修改人',
    `update_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `effective`   VARCHAR(1) COMMENT '是否有效（1有效 0无效）',
    primary key (`id`,`sex`)
) COMMENT ='管理员信息管理表' ENGINE = InnoDB
                              DEFAULT CHARSET = utf8mb4
                              collate = utf8mb4_bin
-- 以 sex 字段为分区键，list表示枚举列表
partition by list columns (`sex`)(
    -- 如果 sex=男，则这条数据存到 P00000000001 分区中
    -- 如果 sex=女，则这条数据存到 P00000000002 分区中
    partition P00000000001 values in('男') engine =InnoDB,
    partition P00000000002 values in('女') engine =InnoDB
    );

CREATE TABLE IF NOT EXISTS `tb_admin_info_partition_range`
(
    `id`          INT AUTO_INCREMENT COMMENT '序号',
    `username`    VARCHAR(20) NOT NULL COMMENT '登录账户',
    `pwd`         VARCHAR(20) NOT NULL COMMENT '密码',
    `sex`         VARCHAR(20) COMMENT '性别',
    `date`        DATE COMMENT '日期',
    `create_user` VARCHAR(20) COMMENT '创建人',
    `create_time` DATE COMMENT '创建时间',
    `update_user` VARCHAR(20) COMMENT '修改人',
    `update_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `effective`   VARCHAR(1) COMMENT '是否有效（1有效 0无效）',
    primary key (`id`,`date`)
) COMMENT ='管理员信息管理表' ENGINE = InnoDB
                              DEFAULT CHARSET = utf8mb4
                              collate = utf8mb4_bin
-- 以 id 字段为分区键，range表示区间
partition by range columns (`date`)(
    -- 如果 date=20230101，则这条数据存到 P20230101 分区中
    -- 如果 date=20230102，则这条数据存到 P20230102 分区中
    partition P20230101 values less than ('20230102') engine =InnoDB,
    partition P20230102 values less than ('20230103') engine =InnoDB
    );

