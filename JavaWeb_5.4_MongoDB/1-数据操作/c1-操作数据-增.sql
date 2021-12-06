// 插入单条数据
// db.集合名.insert(⽂档)
db.td_collection.insert({
    name: "蓝田",
    birthday: new ISODate("2000-07-01"),
    expectSalary: 15000,
    gender: 0,
    city: "bj"
})

// db.集合名.insertOne(⽂档)
db.td_collection.insertOne({
    name: "蓝田",
    birthday: new ISODate("2000-07-01"),
    expectSalary: 15000,
    gender: 1,
    city: "bj"
})

// 插入多条数据
// db.集合名.insert([⽂档,⽂档])
db.td_collection.insert([{
    name: "蓝田",
    birthday: new ISODate("2000-07-01"),
    expectSalary: 15000,
    gender: 0,
    city: "bj"
}, {
    name: "CJ",
    birthday: new ISODate("2000-07-01"),
    expectSalary: 18000,
    gender: 0,
    city: "bj"
}])

// db.集合名.insertMany([⽂档,⽂档])
db.td_collection.insertMany([{
    name: "蓝田",
    birthday: new ISODate("2000-07-01"),
    expectSalary: 15000,
    gender: 0,
    city: "bj"
}, {
    name: "CJ",
    birthday: new ISODate("2000-07-01"),
    expectSalary: 18000,
    gender: 0,
    city: "bj"
}])

