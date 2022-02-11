
create table t_user
(
    id   int primary key,
    name varchar(50),
    age  int,
    sex  int
) engine = innodb
  charset = utf8;

INSERT INTO t_user (id, name, age, sex) VALUES (1, 'a', 22, 1);
INSERT INTO t_user (id, name, age, sex) VALUES (2, 'aa', 18, 2);
INSERT INTO t_user (id, name, age, sex) VALUES (3, 'aaa', 18, 1);
INSERT INTO t_user (id, name, age, sex) VALUES (4, 'aaaa', 20, 2);
INSERT INTO t_user (id, name, age, sex) VALUES (5, 'b+aaa', 18, 1);
INSERT INTO t_user (id, name, age, sex) VALUES (6, 'c+aaa', 20, 2);


-- auto-generated definition
create table tb_admin_info
(
    id          int auto_increment comment '序号'
        primary key,
    username    varchar(20)                         not null comment '登录账户',
    pwd         varchar(20)                         null comment '密码',
    sex         int                                 null comment '性别',
    create_user varchar(20)                         null comment '创建人',
    create_time date                                null comment '创建时间',
    update_user varchar(20)                         null comment '修改人',
    update_time timestamp default CURRENT_TIMESTAMP null comment '修改时间',
    effective   varchar(1)                          null comment '是否有效（1有效 0无效）'
)
    comment '管理员信息管理表' engine = InnoDB;

create index sex
    on tb_admin_info (sex);

INSERT INTO `JavaCode_Database`.tb_admin_info (id, username, pwd, sex, create_user, create_time, update_user, update_time, effective) VALUES (1, 'a', '1', 1, null, null, null, '2021-11-24 11:42:23', null);
INSERT INTO `JavaCode_Database`.tb_admin_info (id, username, pwd, sex, create_user, create_time, update_user, update_time, effective) VALUES (2, 'b', '2', 2, null, null, null, '2021-11-24 11:42:30', null);
INSERT INTO `JavaCode_Database`.tb_admin_info (id, username, pwd, sex, create_user, create_time, update_user, update_time, effective) VALUES (3, 'c', '3', 2, null, null, null, '2021-11-24 12:02:58', null);

