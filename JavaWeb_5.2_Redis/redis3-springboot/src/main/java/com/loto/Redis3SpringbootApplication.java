package com.loto;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class Redis3SpringbootApplication {
    public static void main(String[] args) {
        SpringApplication.run(Redis3SpringbootApplication.class, args);
    }
}
