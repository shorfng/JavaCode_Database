// 慢查询

// 开启内置的查询分析器，记录读写操作效率
// n = 0，表示不记录
// n = 1，表示记录慢速操作（如果值为1，m 必须赋值单位为 ms，⽤于定义慢速查询时间的阈值）
// n = 2，表示记录所有的读写操作
// db.setProfilingLevel(n, m)
db.setProfilingLevel(1, 100)

// 查看索引
db.td_index_explain.getIndexes()

// 模拟慢查询
db.td_index_explain.find({name: "test99989"})
db.td_index_explain.find({name: "test9919"})
db.td_index_explain.find({name: "test9799"})


// 查询监控结果
db.system.profile.find().sort({millis: -1}).limit(3)

