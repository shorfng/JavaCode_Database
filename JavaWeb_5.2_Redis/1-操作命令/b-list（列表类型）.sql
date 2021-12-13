-- -- 从左侧插入列表
-- lpush key v1 v2 v3 ...

-- -- 从列表左侧取出
-- lpop key

-- -- 从右侧插入列表
-- rpush key v1 v2 v3 ...

-- 从列表右侧取出
-- rpop key

-- 将值插入到列表头部
-- lpushx key value

-- 将值插入到列表尾部
-- rpushx key value

-- 从列表左侧取出，当列表为空时阻塞，可以设置最大阻塞时间，单位为秒
-- blpop key timeout

-- 从列表右侧取出，当列表为空时阻塞，可以设置最大阻塞时间，单位为秒
-- blpop key timeout

-- 获得列表中元素个数
-- llen key

-- 获得列表中下标为index的元素，index从0开始
-- lindex key index

-- 回列表中指定区间的元素，区间通过start和end指定
-- lrange key start end

-- 删除列表中与value相等的元素
-- 当count>0时，lrem会从列表左边开始删除;
-- 当count<0时，lrem会从列表后边开始删除;
-- 当count=0时，lrem删除所有值为value的元素
-- lrem key count value

-- 将列表index位置的元素设置成value的值
-- lset key index value

-- 对列表进行修剪，只保留start到end区间
-- ltrim key start end

-- 从key1列表右侧弹出并插入到key2列表左侧
-- rpoplpush key1 key2

-- 从key1列表右侧弹出并插入到key2列表左侧，会阻塞
-- brpoplpush key1 key2

-- 将value插入到列表，且位于值pivot之前或之后
-- linsert key BEFORE/AFTER pivot value
