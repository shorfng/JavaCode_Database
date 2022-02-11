package com.loto.dao;

import com.loto.RunBoot;
import com.loto.entity.City;
import com.loto.repository.CityRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = RunBoot.class)
public class TestMasterSlave {
    @Resource
    private CityRepository cityRepository;

    /**
     * 插入数据
     */
    @Test
    public void testAdd() {
        City city = new City();
        city.setName("shanghai");
        city.setProvince("shanghai");

        cityRepository.save(city);
    }

    @Test
    public void testFind() {
        List<City> list = cityRepository.findAll();
        list.forEach(city -> {
            System.out.println(city.getId() + " " + city.getName() + " " + city.getProvince());
        });
    }
}
