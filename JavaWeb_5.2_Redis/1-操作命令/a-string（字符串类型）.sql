-- 赋值
-- set key value
set name1 loto

-- 取值
-- get key
get name1

-- 取值并赋值
-- getset key value
getset name2 td


-- 当key不存在时才用赋值，设置过期时间
-- set key value nx px 毫秒数

-- 向尾部追加值
append key value

-- 获取字符串长度
strlen key

-- 递增数字
incr key

-- 增加指定的整数
incrby key increment

-- 递减数字
decr key

-- 减少指定的整数
decrby key decrement
