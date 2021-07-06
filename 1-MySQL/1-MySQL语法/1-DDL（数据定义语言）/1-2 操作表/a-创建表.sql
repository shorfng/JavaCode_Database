# 创建表
# create table 表名 (列名 列类型);
CREATE TABLE IF NOT EXISTS `tb_admin_info`
(
    `id`          INT PRIMARY KEY AUTO_INCREMENT COMMENT '序号',
    `username`    VARCHAR(20) NOT NULL COMMENT '登录账户',
    `pwd`         VARCHAR(20) NOT NULL COMMENT '密码',
    `sex`         VARCHAR(20) COMMENT '性别',
    `create_user` VARCHAR(20) COMMENT '创建人',
    `create_time` DATE COMMENT '创建时间',
    `update_user` VARCHAR(20) COMMENT '修改人',
    `update_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `effective`   VARCHAR(1) COMMENT '是否有效（1有效 0无效）'
) COMMENT ='管理员信息管理表' ENGINE = InnoDB
                      DEFAULT CHARSET = utf8;

