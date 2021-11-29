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
