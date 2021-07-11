package com.xxxx.manager;

import com.alibaba.dubbo.spring.boot.annotation.EnableDubboConfiguration;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableDubboConfiguration
@MapperScan("com.xxxx.manager.mapper")
public class ShopManagerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShopManagerApplication.class, args);
    }

}
