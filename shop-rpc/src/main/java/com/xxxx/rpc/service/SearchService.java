package com.xxxx.rpc.service;

import com.github.pagehelper.PageInfo;
import com.xxxx.common.result.ShopPageInfo;
import com.xxxx.rpc.pojo.GoodsVo;

public interface SearchService {
    ShopPageInfo<GoodsVo> test(String searchStr, Integer pageNum, Integer pageSize);
}
