// 插入100 万条数据（在命令行中执行快）
for (var i = 0; i < 1000000; i++) {
    db.td_index_explain.insertOne({id: i, name: "test" + i, salary: (Math.random() * 20000).toFixed(2)});
}

// 查看数量
db.td_index_explain.count()

////////////////////////////////////////////////////////////////

// 返回结果包括：queryPlanner、serverInfo
// db.集合名.find().explain()
// db.集合名.find().explain("queryPlanner")

// 返回结果包括：executionStats、queryPlanner、serverInfo
// db.集合名.find().explain("executionStats")
// db.集合名.find().explain("allPlansExecution")

// 举例
db.td_index_explain.find({name: "test11011"}).explain()
db.td_index_explain.find({name: "test11011"}).explain("queryPlanner")
db.td_index_explain.find({name: "test11011"}).explain("executionStats")
db.td_index_explain.find({name: "test11011"}).explain("allPlansExecution")


/////////////////////////////////////////////////////////////////////////////

// 查看 id 是否建立索引（queryPlanner.winningPlan.stage = COLLSCAN）
db.td_index_explain.find({id: {$gt: 222333}}).explain()

// 给 id 建立索引
db.td_index_explain.createIndex({id: 1})

// queryPlanner.winningPlan.stage = FETCH
// queryPlanner.winningPlan.inputStage = IXSCAN
db.td_index_explain.find({id: {$gt: 222333}}).explain("executionStats")

// name 无索引
db.td_index_explain.find({name: {$gt: "test222333"}}).explain("executionStats")

// 限定返回字段 PROJECTION（id中包含0的数据都不展示）
db.td_index_explain.find({name: {$gt: "test222333"}}, {_id: 0}).explain("executionStats")
