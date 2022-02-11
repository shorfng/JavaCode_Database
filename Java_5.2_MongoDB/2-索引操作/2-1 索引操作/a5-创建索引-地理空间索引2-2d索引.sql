// 测试数据
db.td_index_2d.insertOne({"name": "Temple1", "tile": [32, 22]})
db.td_index_2d.insertOne({"name": "Temple2", "tile": [30, 22]})
db.td_index_2d.insertOne({"name": "Temple3", "tile": [28, 21]})
db.td_index_2d.insertOne({"name": "Temple4", "tile": [34, 27]})
db.td_index_2d.insertOne({"name": "Temple5", "tile": [34, 26]})
db.td_index_2d.insertOne({"name": "Temple6", "tile": [39, 28]})

// 2d 索引，⽤于存储和查找平⾯上的点
db.td_index_2d.ensureIndex({"tile": "2d"}, {"min": -90, "max": 90, "bits": 20})

// 查看
db.td_index_2d.find({"tile": {"$within": {"$box": [[0, 0], [30, 30]]}}})

// 查看索引
db.td_index_2d.getIndexes()
