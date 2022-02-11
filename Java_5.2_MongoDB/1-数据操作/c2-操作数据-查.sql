// 比较条件查询
// db.集合名.find()
db.td_collection.find()    // 无条件查询

// db.集合名.find({条件})
db.td_collection.find({})  // 无条件查询
db.td_collection.find({city: "bj"})                  // where 字段名=值
db.td_collection.find({expectSalary: 15000})         // where 字段名=值
db.td_collection.find({expectSalary: {$eq: 18000}})  // where 字段名=值
db.td_collection.find({expectSalary: {$gt: 10000}})  // where 字段名>值
db.td_collection.find({expectSalary: {$lt: 16000}})  // where 字段名<值
db.td_collection.find({expectSalary: {$gte: 18000}}) // where 字段名>=值
db.td_collection.find({expectSalary: {$lte: 15000}}) // where 字段名<=值
db.td_collection.find({expectSalary: {$ne: 15000}})  // where 字段名!=值

// 逻辑条件查询
// and 且
// db.集合名.find({key1:value1, key2:value2}).pretty()
db.td_collection.find({city: "bj", expectSalary: {$eq: 15000}})

// db.集合名.find({$and:[{key1:value1}, {key2:value2}]}).pretty()
db.td_collection.find({$and: [{city: "bj"}, {expectSalary: 15000}]})

// or 或
// db.集合名.find({$or:[{key1:value1}, {key2:value2}]}).pretty()
db.td_collection.find({$or: [{city: "bj"}, {expectSalary: 15000}]})

// not 非
// db.集合名.find({key:{$not:{$操作符:value}}).pretty()
db.td_collection.find({city: {$not: {$eq: "bj"}}})

// 排序
// db.集合名.find({条件}).sort({排序字段:排序⽅式}))
db.td_collection.find().sort({expectSalary: 1})   // 升序
db.td_collection.find().sort({expectSalary: -1})  // 降序


// 分页查询
// db.集合名.find({条件}).sort({排序字段:排序⽅式})).skip(跳过的⾏数).limit(⼀⻚显示多少数据)
db.td_collection.find().sort({expectSalary: 1}).skip(1).limit(2)




