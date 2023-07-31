package com.loto;

import com.loto.bean.Resume;
import com.loto.dao.ResumeDAO;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@SpringBootApplication
public class MongoTemplateMain {
    public static void main(String[] args) {
        ApplicationContext applicationContext = SpringApplication.run(MongoTemplateMain.class, args);
        ResumeDAO resumeDao = applicationContext.getBean("resumeDao", ResumeDAO.class);

        Resume resume = new Resume();
        resume.setName("lisi22");
        resume.setCity("北京");
        Date date = null;
        String dateStr = "yyyy-MM-dd hh:mm:ss";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateStr);
        try {
            date = simpleDateFormat.parse("2003-11-02 11:13:14");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        resume.setBirthday(date);
        resume.setExpectSalary(28000);
        resumeDao.insertResume(resume);
        System.out.println("resume=" + resume);

        Resume resume2 = resumeDao.findByName("lisi");
        System.out.println(resume2);

        List<Resume> datas = resumeDao.findList("zhangsan");
        System.out.println(datas);

        List<Resume> datas2 = resumeDao.findListByNameAndExpectSalary("zhangsan", 1);
        System.out.println(datas2);
    }
}
