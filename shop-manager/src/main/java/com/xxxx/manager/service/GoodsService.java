package com.xxxx.manager.service;

import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.pojo.Goods;

public interface GoodsService {
    BaseResult addOne(Goods goods);

    BaseResult selectGoodsListByPage(Goods goods, Integer pageNum, Integer pageSize);
}
