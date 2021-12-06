// 根据索引名称删除
// db.集合名.dropIndex("索引名称")
db.td_index.dropIndex("INDEX-NAME")

// 删除该集合中所有索引（_id 对应的索引删除不了）
// db.集合名.dropIndexes()
db.td_index.dropIndexes()
