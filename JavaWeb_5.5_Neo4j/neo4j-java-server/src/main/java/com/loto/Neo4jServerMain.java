package com.loto;

import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Record;
import org.neo4j.driver.Result;
import org.neo4j.driver.Session;

import static org.neo4j.driver.Values.parameters;

public class Neo4jServerMain {
    public static void main(String[] args) {
        Driver driver = GraphDatabase.driver("bolt://192.168.31.246:7687", AuthTokens.basic("neo4j", "root"));

        // 获取会话对象
        Session session = driver.session();
        String cql = "MATCH(p:Person) WHERE p.money > $money return p.name AS name,p.money AS money order by p.money";
        Result result = session.run(cql, parameters("money", 100));
        while (result.hasNext()) {
            Record record = result.next();
            System.out.println(record.get("name").asString() + "," + record.get("money").asDouble());
        }

        session.close();
        driver.close();
    }
}
