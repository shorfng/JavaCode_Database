// 准备数据
db.td_index_2dsphere.insertOne(
    {
        loc: {type: "Point", coordinates: [116.482451, 39.914176]},
        name: "大望路地铁",
        category: "Parks"
    }
    )

db.td_index_2dsphere.insertOne(
    {
        loc: {type: "Point", coordinates: [116.492451, 39.934176]},
        name: "test1",
        category: "Parks"
    }
    )

db.td_index_2dsphere.insertOne(
    {
        loc: {type: "Point", coordinates: [116.462451, 39.954176]},
        name: "test2",
        category: "Parks"
    }
    )


db.td_index_2dsphere.insertOne(
    {
        loc: {type: "Point", coordinates: [116.562451, 38.954176]},
        name: "test3",
        category: "Parks"
    }
    )

db.td_index_2dsphere.insertOne(
    {
        loc: {type: "Point", coordinates: [117.562451, 37.954176]},
        name: "test4",
        category: "Parks"
    }
    )

// 2dsphere 索引，⽤于存储和查找球⾯上的点
db.td_index_2dsphere.ensureIndex({loc: "2dsphere"})

// 以 116.482451, 39.914176 为中心，找 0.05，即0.5公里内的点
db.td_index_2dsphere.find({
    "loc": {
        "$geoWithin": {
            "$center": [[116.482451, 39.914176], 0.05]
        }
    }
})

// 计算中心点最近的三个点
db.td_index_2dsphere.aggregate([
    {
        $geoNear: {
            near: {type: "Point", coordinates: [116.482451, 39.914176]},
            key: "loc",
            distanceField: "dist.calculated"
        }
    },
    {$limit: 3}
])

// 查看索引
db.td_index_2dsphere.getIndexes()
