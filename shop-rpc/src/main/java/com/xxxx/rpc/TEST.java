package com.xxxx.rpc;

import com.github.pagehelper.PageInfo;
import com.xxxx.common.result.ShopPageInfo;
import com.xxxx.rpc.pojo.GoodsVo;
import com.xxxx.rpc.service.SearchService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.io.IOException;
@RestController
public class TEST {
    @Resource
    private SearchService service;

    @RequestMapping
    public ShopPageInfo<GoodsVo> test() throws IOException {
        ShopPageInfo<GoodsVo> list = service.test("华为", 1, 10);
        return list;
    }
}
