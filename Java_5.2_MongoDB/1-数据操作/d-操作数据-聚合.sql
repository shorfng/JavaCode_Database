// 数据准备（8条数据）
db.createCollection("td_aggregation")
db.td_aggregation.insertOne({name:"张晓峰",birthday:new ISODate("2000-07-01"),gender:1,expectSalary:15000,city:"bj"})
db.td_aggregation.insertOne({name:"张震",birthday:new ISODate("1995-04-01"),gender:1,expectSalary:18000,city:"bj"})
db.td_aggregation.insertOne({name:"李山",birthday:new Date("1995-04-01"),gender:1,expectSalary:25000,city:"sh"})
db.td_aggregation.insertOne({name:"李笑来",birthday:new Date("1998-04-01 14:20:09"),gender:1,expectSalary:20000,city:"sh"})
db.td_aggregation.insertOne({name:null,birthday:new Date("1992-04-01 14:20:09"),gender:1,expectSalary:30000,city:"sh"})
db.td_aggregation.insertOne({birthday:new Date("1991-05-01 14:20:09"),gender:1,expectSalary:50000,city:"sz"})
db.td_aggregation.insert([{name:"李丽",birthday:new Date("1996-05-01 14:20:09"),gender:0,expectSalary:21000,city:"sz"}, {name:"李平",birthday:new Date("1997-07-01 14:20:09"),gender:0,expectSalary:22000,city:"sz"}])

// 单目的聚合操作（Single Purpose Aggregation Operation）
// 计算满足条件的数量
db.td_aggregation.find().count()
db.td_aggregation.count()

// 查询去重后，满足条件的字段值
db.td_aggregation.distinct("city")


// 聚合管道（Aggregation Pipeline）
// db.集合名称.aggregate(聚合操作)

// 聚合框架操作
// $group：将集合中的⽂档分组，可⽤于统计结果。
// $project：修改输⼊⽂档的结构。可以⽤来重命名、增加或删除域，也可以⽤于创建计算结果以及嵌套⽂档。
// $match：⽤于过滤数据，只输出符合条件的⽂档。$match使⽤MongoDB的标准查询操作。
// $limit：⽤来限制MongoDB聚合管道返回的⽂档数。
// $skip：在聚合管道中跳过指定数量的⽂档，并返回余下的⽂档。
// $sort：将输⼊⽂档排序后输出。
// $geoNear：输出接近某⼀地理位置的有序⽂档。

// 表达式：处理输⼊⽂档并输出（表达式只能⽤于计算当前聚合管道的⽂档，不能处理其它的⽂档）
// $sum：计算总和
// $avg：计算平均值
// $min：获取集合中所有⽂档对应值得最⼩值
// $max：获取集合中所有⽂档对应值得最⼤值
// $push：在结果⽂档中插⼊值到⼀个数组中
// $addToSet：在结果⽂档中插⼊值到⼀个数组中，但数据不重复
// $first：根据资源⽂档的排序获取第⼀个⽂档数据
// $last：根据资源⽂档的排序获取最后⼀个⽂档数据

// 按照 city 分组，统计每个 city 的值，放在一个数组中
db.td_aggregation.aggregate([{$group: {_id: "$city", city_name: {$push: "$city"}}}])

// 按照 city 分组，统计每个 city 中 expectSalary 的平均值
db.td_aggregation.aggregate([{$group: {_id: "$city", avgSal: {$avg: "$expectSalary"}}}])

db.td_aggregation.aggregate(
    [
        {$group: {_id: "$city", avgSal: {$avg: "$expectSalary"}}},
        {$project: {city: "$city", avgSal: "$avgSal"}}
    ])

// 按照 city 分组，统计每个 city 出现的次数
db.td_aggregation.aggregate([{$group: {_id: "$city", city_count: {$sum: 1}}}])

db.td_aggregation.aggregate(
    [
        {$group: {_id: "$city", city_count: {$sum: 1}}},
        {$match: {city_count: {$gte: 2}}}
    ])


// MapReduce 计算模型

// map：是JavaScript 函数，负责将每⼀个输⼊⽂档转换为零或多个⽂档，⽣成键值对序列,作为 reduce 函数参数
// reduce：是JavaScript 函数，对map操作的输出做合并的化简的操作（将key-value变成key-values，也就是把values数组变成⼀个单⼀的值value）
// out：统计结果存放集合
// query：⼀个筛选条件，只有满⾜条件的⽂档才会调⽤map函数。
// sort：和limit结合的sort排序参数（也是在发往map函数前给⽂档排序），可以优化分组机制
// limit：发往map函数的⽂档数量的上限（要是没有limit，单独使⽤sort的⽤处不⼤）
// finalize：可以对reduce输出结果再⼀次修改
// verbose：是否包括结果信息中的时间信息，默认为fasle

// 原理：Map 函数调⽤ emit(key, value), 遍历 collection 中所有的记录, 将 key 与 value 传递给 Reduce 函数进⾏处理
// db.集合名称.mapReduce(
//     // map 函数
//     function () {
//         emit(key, value);
//     },
//     // reduce 函数
//     function (key, values) {
//         return reduceFunction
//     },
//     {
//     out: collection,
//     query: document,
//     sort: document,
//     limit: number,
//     finalize: <function>,
//     verbose: <boolean >
//     }
// )

db.td_aggregation.mapReduce(
    function () {
        emit(this.city, this.expectSalary);
    },
    function (key, value) {
        return Array.avg(value);
    },
    {
        out: "cityAvgSal",
        query: {expectSalary: {$gt: 15000}},
        finalize: function (key, value) {
            return value + 500;
        },
        verbose: true
    }
    )

db.cityAvgSal.find()
