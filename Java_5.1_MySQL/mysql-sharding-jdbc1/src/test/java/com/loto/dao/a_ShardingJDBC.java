package com.loto.dao;

import com.loto.RunBoot;
import com.loto.entity.BOrder;
import com.loto.entity.City;
import com.loto.entity.Position;
import com.loto.entity.PositionDetail;
import com.loto.repository.BOrderRepository;
import com.loto.repository.CityRepository;
import com.loto.repository.PositionDetailRepository;
import com.loto.repository.PositionRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Repeat;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Random;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = RunBoot.class)
public class a_ShardingJDBC {
    @Resource
    private PositionRepository positionRepository;

    @Resource
    private PositionDetailRepository positionDetailRepository;

    @Resource
    private CityRepository cityRepository;

    @Resource
    private BOrderRepository orderRepository;

    /**
     * 向 Position 表添加数据
     */
    @Test
    public void testAdd() {
        for (int i = 1; i <= 20; i++) {
            Position position = new Position();

            //position.setId(i);
            position.setName("td" + i);
            position.setSalary("1000000");
            position.setCity("beijing");

            positionRepository.save(position);
        }
    }

    /**
     * 向 Position 表、PositionDetail 表添加数据
     */
    @Test
    public void testAdd2() {
        for (int i = 1; i <= 20; i++) {
            Position position = new Position();
            position.setName("TD" + i);
            position.setSalary("1000000");
            position.setCity("beijing");
            positionRepository.save(position);

            PositionDetail positionDetail = new PositionDetail();
            positionDetail.setPid(position.getId());
            positionDetail.setDescription("this is a message " + i);
            positionDetailRepository.save(positionDetail);
        }
    }

    /**
     * 根据 id，查找分表的数据之和
     */
    @Test
    public void testLoad() {
        Object object = positionRepository.findPositionsById(672154149885837312L);
        Object[] position = (Object[]) object;
        System.out.println("===========================================");
        System.out.println(position[0] + " " + position[1] + " " + position[2] + " " + position[3] + " " + position[4]);
    }

    /**
     * 广播表
     */
    @Test
    public void testBroadCast() {
        City city = new City();
        city.setName("beijing");
        city.setProvince("beijing");

        cityRepository.save(city);
    }

    /**
     * 分库分表
     */
    @Test
    @Repeat(100)
    public void testShardingBOrder() {
        BOrder order = new BOrder();

        Random random = new Random();
        int companyId = random.nextInt(10);
        order.setCompanyId(companyId);

        order.setDel(false);
        order.setPositionId(3242342);
        order.setUserId(2222);
        order.setPublishUserId(1111);
        order.setResumeType(1);
        order.setStatus("AUTO");
        order.setCreateTime(new Date());
        order.setOperateTime(new Date());
        order.setWorkYear("2");
        order.setName("TD");
        order.setPositionName("Java");
        order.setResumeId(23233);

        orderRepository.save(order);
    }
}
