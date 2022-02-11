package com.loto.dao;

import com.loto.RunBoot;
import com.loto.entity.Position;
import com.loto.repository.PositionRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = RunBoot.class)
public class TestShardingProxy {
    @Resource
    private PositionRepository positionRepository;

    @Test
    public void test1() {
        List<Position> list = positionRepository.findAll();
        list.forEach(position -> {
            System.out.println(position.getId() + " " + position.getName() + " " + position.getSalary());
        });
    }

    @Test
    public void test2() {
        Position position = new Position();
        position.setName("tiger");
        position.setSalary("30000");
        position.setCity("shanghai");
        positionRepository.save(position);
    }
}
