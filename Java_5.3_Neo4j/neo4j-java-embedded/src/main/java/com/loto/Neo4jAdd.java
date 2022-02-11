package com.loto;

import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Label;
import org.neo4j.graphdb.Node;
import org.neo4j.graphdb.Transaction;
import org.neo4j.graphdb.factory.GraphDatabaseFactory;

import java.io.File;

public class Neo4jAdd {
    private static final File databaseDirectory = new File("target/graph.db");

    public static void main(String[] args) {
        // 创建数据库服务对象
        GraphDatabaseService graphDatabaseService = new GraphDatabaseFactory().newEmbeddedDatabase(databaseDirectory);
        System.out.println("database load!");

        // 获取事务，开启事务
        Transaction tx = graphDatabaseService.beginTx();
        Node n1 = graphDatabaseService.createNode();
        n1.setProperty("name", "张三");
        n1.setProperty("character", "A");
        n1.setProperty("money", 1101);
        n1.addLabel(new Label() {
            @Override
            public String name() {
                return "Person";
            }
        });

        // 定义cql
        String cql = "CREATE(p:Person {name:'李四',character:'B',money:21000})";
        graphDatabaseService.execute(cql);
        tx.success();

        // 关闭
        tx.close();
        graphDatabaseService.shutdown();
        System.out.println("database shutdown");
    }
}
