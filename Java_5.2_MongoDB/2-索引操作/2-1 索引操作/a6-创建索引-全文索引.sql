// 测试数据
db.td_index_text.insertOne({id: 1, name: "test1", description: "one world one dream in bj", city: "bj"})
db.td_index_text.insertOne({id: 2, name: "test2", description: "two world one dream in nj", city: "nj"})
db.td_index_text.insertOne({id: 3, name: "test3", description: "dj is not bj and nj", city: "dj"})

// db.集合.createIndex({"字段": "text"})
db.td_index_text.createIndex({description: "text"})

// db.集合.find({"$text": {"$search": "关键词"}})
db.td_index_text.find({"$text": {"$search": "two"}})

// 查看索引
db.td_index_text.getIndexes()
