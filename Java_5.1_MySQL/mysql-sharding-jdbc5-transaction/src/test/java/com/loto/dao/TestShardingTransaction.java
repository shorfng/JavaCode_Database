package com.loto.dao;

import com.loto.RunBoot;
import com.loto.entity.Position;
import com.loto.entity.PositionDetail;
import com.loto.repository.PositionDetailRepository;
import com.loto.repository.PositionRepository;
import org.apache.shardingsphere.transaction.annotation.ShardingTransactionType;
import org.apache.shardingsphere.transaction.core.TransactionType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = RunBoot.class)
public class TestShardingTransaction {
    @Resource
    private PositionRepository positionRepository;

    @Resource
    private PositionDetailRepository positionDetailRepository;

    @Test
    @Transactional
    @ShardingTransactionType(TransactionType.XA)
    //@ShardingTransactionType(TransactionType.BASE)
    public void test1() {
        // 设置分布式事务类型
        //TransactionTypeHolder.set(TransactionType.XA);   // XA，与30行注解效果相同
        //TransactionTypeHolder.set(TransactionType.BASE); // saga/seata，与31行注解效果相同，取决于pom引入了哪种依赖

        for (int i = 1; i <= 5; i++) {
            Position position = new Position();
            position.setName("root" + i);
            position.setSalary("1000000");
            position.setCity("beijing");
            positionRepository.save(position);

            if (i == 3) {
                throw new RuntimeException("人为制造异常");
            }

            PositionDetail positionDetail = new PositionDetail();
            positionDetail.setPid(position.getId());
            positionDetail.setDescription("this is a root " + i);
            positionDetailRepository.save(positionDetail);
        }
    }
}
