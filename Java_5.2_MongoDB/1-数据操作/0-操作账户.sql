// 切换到 admin 数据库
use admin

// 内置角色
// read：允许用户读取指定数据库
// readWrite：允许用户读写指定数据库
// dbAdmin：允许用户在指定数据库中执行管理函数，如索引创建、删除，查看统计或访问 system.profile
// userAdmin：允许用户向system.users集合写入，可以找指定数据库里创建、删除和管理用户
// clusterAdmin：只在admin数据库中可用，赋予用户所有分片和复制集相关函数的管理权限
// readAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的读权限
// readWriteAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的读写权限
// userAdminAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的userAdmin权限
// dbAdminAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的dbAdmin权限
// root：只在admin数据库中可用。超级账号，超级权限
// dbOwner：库拥有者权限，即readWrite、dbAdmin、userAdmin角色的合体

// 添加用户格式
db.createUser({
    user: "账号",
    pwd: "密码",
    roles: [
        {role: "角色", db: "安全认证的数据库实例名称"},
        {role: "角色", db: "安全认证的数据库实例名称"}
    ]
})

// role=root，则db必须为admin库
db.createUser({
    user: "myroot",
    pwd: "root",
    roles: [
        {role: "root", db: "admin"}
    ]
})

// 修改密码
db.changeUserPassword('root', 'rootNew');

// 用户添加角色
db.grantRolesToUser('用户名', [{role: '角色名', db: '数据库名'}])

// 验证用户
// db.auth("账号", "密码")
db.auth("myroot", "root")

// 删除用户
// db.dropUser("账号")
db.dropUser("myroot")


// 以 auth 方式启动 mongod（也可以在mongo.conf 中添加auth=true 参数）
./bin/mongod -f conf/mongo.conf --auth
