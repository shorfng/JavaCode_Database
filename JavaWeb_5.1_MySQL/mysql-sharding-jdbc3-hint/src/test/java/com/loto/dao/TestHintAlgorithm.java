package com.loto.dao;

import com.loto.RunBoot;
import com.loto.entity.City;
import com.loto.repository.CityRepository;
import org.apache.shardingsphere.api.hint.HintManager;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = RunBoot.class)
public class TestHintAlgorithm {
    @Resource
    private CityRepository cityRepository;

    @Test
    public void test1() {
        // 在代码执行查询前使用 HintManager 指定执行策略值
        HintManager hintManager = HintManager.getInstance();
        hintManager.setDatabaseShardingValue(0L); // 强制路由到 ds${xx%2}

        List<City> list = cityRepository.findAll();
        list.forEach(city -> {
            System.out.println(city.getId() + " " + city.getName() + " " + city.getProvince());
        });
    }
}
