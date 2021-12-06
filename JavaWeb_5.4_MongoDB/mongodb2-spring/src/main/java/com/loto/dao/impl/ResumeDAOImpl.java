package com.loto.dao.impl;

import com.loto.bean.Resume;
import com.loto.dao.ResumeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("resumeDao")
public class ResumeDAOImpl implements ResumeDAO {
    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public void insertResume(Resume resume) {
        mongoTemplate.insert(resume, "td_collection");
    }

    @Override
    public Resume findByName(String name) {
        Query query = new Query();
        query.addCriteria(Criteria.where("name").is(name));
        List<Resume> datas = mongoTemplate.find(query, Resume.class, "td_collection");
        return datas.isEmpty() ? null : datas.get(0);
    }

    @Override
    public List<Resume> findList(String name) {
        Query query = new Query();
        query.addCriteria(Criteria.where("name").is(name));
        List<Resume> datas = mongoTemplate.find(query, Resume.class, "td_collection");
        return datas;
    }

    @Override
    public List<Resume> findListByNameAndExpectSalary(String name, double expectSalary) {
        Query query = new Query();
        //query.addCriteria(Criteria.where("name").is(name).andOperator(Criteria.where("expectSalary").is(expectSalary)));
        query.addCriteria(Criteria.where("name").is(name).andOperator(Criteria.where("expectSalary").is(expectSalary)));
        return mongoTemplate.find(query, Resume.class, "td_collection");
    }
}
