// 数据准备
db.td_index.insertOne({name: "test1", salary: 18000})
db.td_index.insertOne({name: "test2", salary: 29000, birth: new ISODate("2000-01-01")})

// db.集合名.createIndex({"字段名":排序⽅式})
db.td_index.createIndex({name: 1})

// 创建索引并在后台运⾏
// db.集合名.createIndex({"字段":排序⽅式}, {background: true})
db.td_index.createIndex({name: 1}, {background: true})

// 旧语法
// db.集合名.ensureIndex({"字段名":排序⽅式})
db.td_index.ensureIndex({name: 1})

// 查看索引
db.td_index.getIndexes()
