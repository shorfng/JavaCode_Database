create table `c_user`
(
    `id`         bigint(11) not null auto_increment,
    `name`       varchar(256) default null,
    `pwd_plain`  varchar(256) default null,
    `pwd_cipher` varchar(256) default null,
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4;
