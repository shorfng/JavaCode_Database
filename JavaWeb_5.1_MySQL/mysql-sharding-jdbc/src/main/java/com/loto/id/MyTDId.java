package com.loto.id;

import org.apache.shardingsphere.core.strategy.keygen.SnowflakeShardingKeyGenerator;
import org.apache.shardingsphere.spi.keygen.ShardingKeyGenerator;

import java.util.Properties;

public class MyTDId implements ShardingKeyGenerator {
    // 此处使用雪花算法，测试用（开发具体看业务需要写具体的算法逻辑）
    private SnowflakeShardingKeyGenerator snow = new SnowflakeShardingKeyGenerator();

    @Override
    public Comparable<?> generateKey() {
        System.out.println("------执行了自定义主键生成器MyTDId-------");
        return snow.generateKey();
    }

    @Override
    public String getType() {
        return "TDKEY";
    }

    @Override
    public Properties getProperties() {
        return null;
    }

    @Override
    public void setProperties(Properties properties) {

    }
}
