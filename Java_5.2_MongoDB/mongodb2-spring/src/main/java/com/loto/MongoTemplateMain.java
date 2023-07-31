package com.loto;

import com.loto.bean.Resume;
import com.loto.dao.ResumeDAO;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MongoTemplateMain {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

        ResumeDAO resumeDao = applicationContext.getBean("resumeDao", ResumeDAO.class);


        //Resume resume = new Resume();
        //resume.setName("lisi");
        //resume.setCity("北京");
        //
        //Date date = null;
        //String dateStr = "yyyy-MM-dd hh:mm:ss";
        //SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateStr);
        //
        //try {
        //    date = simpleDateFormat.parse("2003-10-02 11:13:14");
        //} catch (ParseException e) {
        //    e.printStackTrace();
        //}
        //
        //resume.setBirthday(date);
        //resume.setExpectSalary(28000);
        //resumeDao.insertResume(resume);


        Resume resume = resumeDao.findByName("lisi");
        System.out.println(resume);

        List<Resume> datas = resumeDao.findList("zhangsan");
        System.out.println(datas);

        List<Resume> datas2 = resumeDao.findListByNameAndExpectSalary("zhangsan", 25000);
        System.out.println(datas2);
    }
}
