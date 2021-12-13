import org.junit.Test;
import redis.clients.jedis.Jedis;

/**
 * Author：蓝田_Loto
 * <p>Date：2021-12-13 15:18</p>
 * <p>PageName：TestRedis.java</p>
 * <p>Function：</p>
 */

public class TestRedis {
    @Test
    public void testConn() {
        // 与Redis建立连接
        Jedis redis = new Jedis("127.0.0.1", 6379);

        // 在Redis中写字符串 key value
        redis.set("jedis:name:1", "jd-zhangfei");

        // 获得Redis中字符串的值
        System.out.println(redis.get("jedis:name:1"));

        // 在Redis中写list
        redis.lpush("jedis:list:1", "1", "2", "3", "4", "5");

        // 获得list的长度
        System.out.println(redis.llen("jedis:list:1"));
    }
}
