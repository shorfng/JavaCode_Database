package com.loto;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

public class Document_Find {
    public static void main(String[] args) {
        // 新建 MongoClient
        MongoClient mongoClient = new MongoClient("192.168.31.246", 27017);

        // 获取数据库对象
        MongoDatabase mongoDatabase = mongoClient.getDatabase("td");

        // 获取集合对象
        MongoCollection<Document> collection = mongoDatabase.getCollection("td_collection");

        // 根据 expectSalary 降序排列
        Document sortDocument = new Document();
        sortDocument.append("expectSalary", -1);
        FindIterable<Document> findIterable = collection.find().sort(sortDocument);
        for (Document document : findIterable) {
            System.out.println(document);
        }

        // 关闭 MongoClient
        mongoClient.close();
    }
}
