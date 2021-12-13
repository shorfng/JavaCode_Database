package com.loto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.TimeUnit;

/**
 * Author：蓝田_Loto
 * <p>Date：2021-12-13 16:55</p>
 * <p>PageName：RedisController.java</p>
 * <p>Function：</p>
 */

@RestController
@RequestMapping(value = "/redis")
public class RedisController {
    @Autowired
    RedisTemplate redisTemplate;

    // http://localhost:8080/redis/put?key=td&value=123
    @GetMapping("/put")
    public String put(@RequestParam(required = true) String key, @RequestParam(required = true) String value) {
        // 设置过期时间为20秒
        redisTemplate.opsForValue().set(key, value, 20, TimeUnit.SECONDS);
        return "Success";
    }

    // http://localhost:8080/redis/get?key=td
    @GetMapping("/get")
    public String get(@RequestParam(required = true) String key) {
        return (String) redisTemplate.opsForValue().get(key);
    }
}
