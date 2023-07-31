package com.loto;

import com.loto.repository.ResumeRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class MongoRepositoryMain {
    public static void main(String[] args) {
        ApplicationContext applicationContext = SpringApplication.run(MongoRepositoryMain.class, args);
        ResumeRepository resumeRepository = applicationContext.getBean(ResumeRepository.class);

        // 插入
        //Resume resume = new Resume();
        //resume.setName("zhangsan");
        //resume.setExpectSalary(1);
        //resume.setCity("bj");
        //resumeRepository.save(resume);

        // 查询
        System.out.println(resumeRepository.findAll());
        System.out.println(resumeRepository.findByNameEquals("zhangsan"));
        System.out.println(resumeRepository.findByNameAndExpectSalary("zhangsan", 1));
    }
}
