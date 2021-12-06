db.td_collection.deleteOne({city: "bj"})  // 删除满足条件的1条数据
db.td_collection.deleteMany({city: "bj"}) // 删除满足条件的所有数据


// 参数说明：
// query :（可选）删除的⽂档的条件
// justOne : （可选）如果设为 true 或 1，则只删除⼀个⽂档，如果不设置该参数，或使⽤默认值 false，则删除所有匹配条件的⽂档
// writeConcern :（可选）⽤来指定mongod对写操作的回执⾏为

// db.collection.remove(
// <query>,
// {
//     justOne: <boolean>,
//     writeConcern: <document>
// })

// 删除满足条件的所有数据
db.td_collection.remove({expectSalary: 18000})

// 删除满足条件的第一条数据
db.td_collection.remove(
    {city: "bj"},
    {
        justOne: true
    })

// 删除满足条件的所有数据
db.td_collection.remove(
    {city: "bj"},
    {
        justOne: false
    })



