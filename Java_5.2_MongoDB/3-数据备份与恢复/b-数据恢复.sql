// --host <:port>, -h <:port>：MongoDB所在服务器地址，默认为： localhost:37017
// --db 或者 -d ：需要恢复的数据库实例，例如：test，当然这个名称也可以和备份时候的不一样，比如test2
// --drop：恢复的时候，先删除当前数据，然后恢复备份的数据。就是说，恢复后，备份后添加修改的数据都会被删除，慎用！
// <path>：mongorestore 最后的一个参数，设置备份数据所在位置，不能同时指定 <path> 和 --dir 选项，--dir也可以设置备份目录。
// 注意: 恢复指定的数据库 需要在恢复的路径中出现数据库的名字
// --dir：指定备份的目录，不能同时指定 <path> 和 --dir 选项
mongorestore -h <hostname><:port> -d dbname <path>

// 举例
./bin/mongorestore -h 127.0.0.1:37017 -d lg /root/bdatas/td

// --oplogReplay：可以重放oplog.bson中的操作内容
// --oplogLimit：回放的时间节点，即此时间之前的数据恢复，假设你后面有误操作，误操作的不恢复
mongorestore -h localhost:37017 --oplogReplay /root/dump

// 通过 oplog 查询误操作的最后时间
/root/mongodb/bin/bsondump oplog.rs.bson | grep ""op":"d"" | head
// 或
db.oplog.rs.find({"op" : "d"}).sort({"ts":-1})
