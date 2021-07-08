package com.xxxx.manager.service;

import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.pojo.GoodsType;

import java.util.List;

public interface GoodsTypeService {
    List<GoodsType> queryAll();

    BaseResult addType(GoodsType goodsType);

    BaseResult delType(Short id);
}
