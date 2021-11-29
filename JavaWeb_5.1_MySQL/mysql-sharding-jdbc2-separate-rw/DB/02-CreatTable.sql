create table `city`
(
    `id`       bigint(11) not null auto_increment,
    `name`     varchar(256) default null,
    `province` varchar(256) default null,
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;
