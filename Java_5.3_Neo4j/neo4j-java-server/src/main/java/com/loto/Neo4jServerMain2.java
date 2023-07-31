package com.loto;

import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Record;
import org.neo4j.driver.Result;
import org.neo4j.driver.Session;

import static org.neo4j.driver.Values.parameters;

public class Neo4jServerMain2 {
    public static void main(String[] args) {
        Driver driver = GraphDatabase.driver("bolt://192.168.31.246:7687", AuthTokens.basic("neo4j", "root"));

        // 获取会话对象
        Session session = driver.session();
        String cql = "MATCH p=shortestPath((person:Person{name:$startName})-[*1..4]-(person2:Person {name:$endName})) return p";
        Result result = session.run(cql, parameters("startName", "王启年", "endName", "九品射手燕小乙"));
        while (result.hasNext()) {
            Record record = result.next();
            System.out.println(record);
        }

        session.close();
        driver.close();
    }
}
