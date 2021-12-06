// 参数说明：
// query : update的查询条件，类似 sql update 查询内 where 后⾯的
// update : update的对象和⼀些更新的操作符（如$set,$inc...）等，类似 sql update 中 set 后⾯的
    // $set ：设置字段值
    // $unset :删除指定字段
    // $inc：对修改的值进行自增
// upsert : 可选，如果不存在update的记录，是否插⼊ objNew（true为插⼊，默认是false，不插⼊）
// multi : 可选，MongoDB 默认是false，只更新找到的第⼀条记录，如果为true，就把按条件查出来多条记录全部更新
// writeConcern :可选，⽤来指定mongod对写操作的回执行为，比如写的行为是否需要确认。

// db.集合名.update(
// <query>,
// <update>,
// {
//     upsert: <boolean>,
//     multi: <boolean>,
//     writeConcern: <document>
// })

// 举例：
// db.集合名.update({条件},{$set:{字段名:值}},{multi:true})
// 命令行中有效，multi=true，只修改找到的第⼀条记录，multi=false，修改全部
db.td_collection.update(
    {expectSalary: 18000},
    {$set: {expectSalary: 28000}},
    {
        multi: true,
        upsert: false
    })

// updateOne：每执行一次只修改找到的第⼀条记录
db.td_collection.updateOne(
    {expectSalary: 18000},
    {$set: {expectSalary: 28000}},
    {
        upsert: false
    })

// updateMany：符合条件的都修改
db.td_collection.updateMany(
    {expectSalary: 28000},
    {$set: {expectSalary: 18000}},
    {
        upsert: false
    })

// 测试修改效果
db.td_collection.find({expectSalary: 28000})
db.td_collection.find({expectSalary: 18000})

// 下面三个语句效果相同，只要没有找到符合条件的数据，且upsert: true，则会自动插入一条要设置的数据
db.td_collection.update(
    {expectSalary: 88000},
    {$set: {expectSalary: 15000}},
    {
        upsert: true
    })

db.td_collection.updateOne(
    {expectSalary: 88000},
    {$set: {expectSalary: 15000}},
    {
        upsert: true
    })

db.td_collection.updateMany(
    {expectSalary: 88000},
    {$set: {expectSalary: 15000}},
    {
        upsert: true
    })

// 测试修改效果：会新增3条数据
db.td_collection.find({expectSalary: 15000})

// 清空字段值
// update：清空一条
db.td_collection.update(
    {name: "蓝田"},
    {$unset: {expectSalary: ""}},
    {
        upsert: false
    })

// updateOne：清空一条
db.td_collection.updateOne(
    {name: "蓝田"},
    {$unset: {expectSalary: ""}},
    {
        upsert: false
    })

// updateMany：清空所有满足条件的
db.td_collection.updateMany(
    {name: "蓝田"},
    {$unset: {expectSalary: ""}},
    {
        upsert: false
    })

// 测试修改效果
db.td_collection.find({name: "蓝田"})

// 找到满足条件 name: "蓝田" 的第一条数据，然后清空 expectSalary 之外的所有字段的值，并设置 expectSalary = 18000
db.td_collection.update(
    {name: "蓝田"},
    {expectSalary: 18000},
    {
        upsert: false
    })

// 测试修改效果
db.td_collection.find({expectSalary: 18000})
