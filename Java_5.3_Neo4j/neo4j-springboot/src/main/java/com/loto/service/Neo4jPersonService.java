package com.loto.service;

import com.loto.bean.Person;
import com.loto.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("personService")
public class Neo4jPersonService {
    @Autowired
    private PersonRepository personRepository;

    public List<Person> getAll() {
        List<Person> datas = new ArrayList<>();
        personRepository.findAll().forEach(person -> datas.add(person));
        return datas;
    }

    public Person save(Person person) {
        return personRepository.save(person);
    }

    public List<Person> personList(double money) {
        return personRepository.personList(money);
    }

    public List<Person> shortestPath(String startName, String endName) {
        return personRepository.shortestPath(startName, endName);
    }

    public List<Person> personListDept(String name) {
        return personRepository.personListDept(name);
    }
}
