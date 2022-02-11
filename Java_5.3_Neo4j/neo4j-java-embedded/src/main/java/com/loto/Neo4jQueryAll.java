package com.loto;

import org.neo4j.graphdb.*;
import org.neo4j.graphdb.factory.GraphDatabaseFactory;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class Neo4jQueryAll {
    private static final File databaseDirectory = new File("target/graph.db");

    public static void main(String[] args) {
        // 创建数据库服务对象
        GraphDatabaseService graphDatabaseService = new GraphDatabaseFactory().newEmbeddedDatabase(databaseDirectory);
        System.out.println("database load!");
        String cql = "MATCH(p:Person) where p.money < $money return p";
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("money", 25000);

        // 获取事务，开启事务
        Transaction tx = graphDatabaseService.beginTx();
        Result result = graphDatabaseService.execute(cql, parameters);
        while (result.hasNext()) {
            Map<String, Object> row = result.next();
            System.out.println(row);
            for (String key : result.columns()) {
                Node nd = (Node) row.get(key);
                System.out.printf("%s=%s:%s%n", key, nd.getProperty("name"), nd.getProperty("money"));
            }
        }
        tx.success();

        // 关闭
        tx.close();
        graphDatabaseService.shutdown();
    }
}
