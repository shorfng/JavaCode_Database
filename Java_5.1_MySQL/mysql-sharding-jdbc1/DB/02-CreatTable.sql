create table `position`
(
    `id`     bigint(11) not null auto_increment,
    `name`   varchar(256) default null,
    `salary` varchar(50)  default null,
    `city`   varchar(256) default null,
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;

create table `position_detail`
(
    `id`          bigint(11) not null auto_increment,
    `pid`         bigint(11) not null default '0',
    `description` text                default null,
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;

# 广播表
create table `city`
(
    `id`       bigint(11) not null auto_increment,
    `name`     varchar(256) default null,
    `province` varchar(256) default null,
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;

# 分库分表
create table `b_order0`
(
    `id`              bigint(20)   not null auto_increment,
    `is_del`          bit(1)       not null default 0 comment '是否被删除',
    `company_id`      int(11)      not null comment '公司id',
    `position_id`     bigint(11)   not null comment '职位id',
    `user_id`         int(11)      not null comment '用户id',
    `publish_user_id` int(11)      not null comment '职位发布者id',
    `resume_type`     int(2)       not null default 0 comment '简历类型：0 附件 1 在线',
    `status`          varchar(256) not null comment '投递状态 投递状态 wait-待处理 auto_filter-自动过滤 prepare_contact-待沟通 refuse-拒绝 arrange_interview-通知面试',
    `create_time`     datetime     not null comment '创建时间',
    `operate_time`    datetime     not null comment '操作时间',
    `work_year`       varchar(100)          default null comment '工作年限',
    `name`            varchar(256)          default null comment '投递简历人名字',
    `position_name`   varchar(256)          default null comment '职位名称',
    `resume_id`       int(10)               default null comment '投递的简历id（在线和附件都记录，通过resumetype进行区别在线还是附件）',
    primary key (`id`),
    key `index_createtime` (`create_time`),
    key `index_companyid_status` (`company_id`, `status`(255), `is_del`),
    key `i_comid_pub_ctime` (`company_id`, `publish_user_id`, `create_time`),
    key `index_companyid_positionid` (`company_id`, `position_id`) using btree
) engine = innodb
  default charset = utf8mb4;

create table `b_order1`
(
    `id`              bigint(20)   not null auto_increment,
    `is_del`          bit(1)       not null default 0 comment '是否被删除',
    `company_id`      int(11)      not null comment '公司id',
    `position_id`     bigint(11)   not null comment '职位id',
    `user_id`         int(11)      not null comment '用户id',
    `publish_user_id` int(11)      not null comment '职位发布者id',
    `resume_type`     int(2)       not null default 0 comment '简历类型：0 附件 1 在线',
    `status`          varchar(256) not null comment '投递状态 投递状态 wait-待处理 auto_filter-自动过滤 prepare_contact-待沟通 refuse-拒绝 arrange_interview-通知面试',
    `create_time`     datetime     not null comment '创建时间',
    `operate_time`    datetime     not null comment '操作时间',
    `work_year`       varchar(100)          default null comment '工作年限',
    `name`            varchar(256)          default null comment '投递简历人名字',
    `position_name`   varchar(256)          default null comment '职位名称',
    `resume_id`       int(10)               default null comment '投递的简历id（在线和附件都记录，通过resumetype进行区别在线还是附件）',
    primary key (`id`),
    key `index_createtime` (`create_time`),
    key `index_companyid_status` (`company_id`, `status`(255), `is_del`),
    key `i_comid_pub_ctime` (`company_id`, `publish_user_id`, `create_time`),
    key `index_companyid_positionid` (`company_id`, `position_id`) using btree
) engine = innodb
  default charset = utf8mb4;

