// -h：MongoDB所在服务器地址，例如：127.0.0.1，当然也可以指定端口号：127.0.0.1:37017
// --db 或者 -d ：需要备份的数据库实例
// -o：备份的数据存放位置，例如：/root/bdatas 在备份完成后，系统自动在root目录下建立一个bdatas目录，这个目录里面存放该数据库实例的备份数据
mongodump -h 服务器地址 -d 数据库实例名称 -o 备份数据存放位置

// 举例
// 备份所有 MongoDB 数据
mongodump --host 192.168.211.136 --port 37017

// 备份指定的数据库
mongodump --port 37017 --d dbname --out /data/backup/

// 将备份指定数据库的集合 td
mongodump --collection mycol -d td

// oplog 是replica set或者master/slave模式专用
// --oplog 选项只对全库导出有效，-d 和--oplog 不能同时使用
./bin/mongodump -h 127.0.0.1:37017 --oplog -o /root/bdatas
