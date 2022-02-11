package com.loto;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

public class Document_Insert {
    public static void main(String[] args) {
        // 新建 MongoClient
        MongoClient mongoClient = new MongoClient("192.168.31.246", 27017);

        // 获取数据库对象
        MongoDatabase mongoDatabase = mongoClient.getDatabase("td");

        // 获取集合对象
        MongoCollection<Document> collection = mongoDatabase.getCollection("td_collection");

        //  构建Document 对象，并插入到集合中
        Document document = Document.parse("{name:'lisi',city:'北京',birth_day:new ISODate('2001-08-01'),expectSalary:18000}");
        collection.insertOne(document);

        // 关闭 MongoClient
        mongoClient.close();
    }
}
