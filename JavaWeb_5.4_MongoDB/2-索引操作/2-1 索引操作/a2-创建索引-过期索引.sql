// 数据准备
db.td_index.insertOne({name: "test1", salary: 18000})
db.td_index.insertOne({name: "test2", salary: 29000, birth: new ISODate("2000-01-01")})

// 特殊的单键索引
// db.集合名.createIndex({"⽇期字段":排序⽅式}, {expireAfterSeconds: 秒数})
db.td_index.createIndex({birth: 1}, {expireAfterSeconds: 5})

// 查看索引
db.td_index.getIndexes()
