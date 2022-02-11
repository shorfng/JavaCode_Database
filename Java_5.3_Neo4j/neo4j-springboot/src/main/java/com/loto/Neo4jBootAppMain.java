package com.loto;

import com.loto.bean.Person;
import com.loto.service.Neo4jPersonService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.util.List;

@SpringBootApplication
public class Neo4jBootAppMain {
    public static void main(String[] args) {
        Person person = new Person();
        person.setName("testboot");
        person.setMoney(12345.45);
        person.setCharacter("A");
        person.setAge(11);

        ApplicationContext applicationContext = SpringApplication.run(Neo4jBootAppMain.class, args);
        Neo4jPersonService personService = applicationContext.getBean("personService", Neo4jPersonService.class);
        Person p1 = personService.save(person);
        System.out.println(p1);
        System.out.println(personService.getAll());

        System.out.println("=====================================");

        // 查看money 大于指定值的Person 列表
        List<Person> personList = personService.personList(1000);
        System.out.println(personList);

        System.out.println("=====================================");

        // 指定开始的名字 和 结束的名字 查询最短路径 限定深度为4以层包含4
        List<Person> personList2 = personService.shortestPath("王启年", "九品射手燕小乙");
        System.out.println(personList2);

        System.out.println("=====================================");

        // 查询指定名字有关的节点，深度2以内
        List<Person> personList3 = personService.personListDept("范闲");
        for (Person pe : personList3) {
            System.out.println(pe);
        }
    }
}
