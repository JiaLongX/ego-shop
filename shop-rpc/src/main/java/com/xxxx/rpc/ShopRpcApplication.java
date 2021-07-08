package com.xxxx.rpc;

import com.alibaba.dubbo.spring.boot.annotation.EnableDubboConfiguration;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableDubboConfiguration
@MapperScan("com.xxxx.rpc.mapper")
public class ShopRpcApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShopRpcApplication.class, args);
    }

}
