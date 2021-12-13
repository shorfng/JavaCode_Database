import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import redis.clients.jedis.Jedis;

import java.io.Serializable;

/**
 * Author：蓝田_Loto
 * <p>Date：2021-12-13 15:18</p>
 * <p>PageName：TestRedis.java</p>
 * <p>Function：</p>
 */

@ContextConfiguration({"classpath:redis.xml"})
public class TestRedis extends AbstractJUnit4SpringContextTests {
    @Autowired
    private RedisTemplate<Serializable, Serializable> rt;

    @Test
    public void testConn() {
        rt.opsForValue().set("name", "zhangfei");
        System.out.println(rt.opsForValue().get("name"));
    }
}
