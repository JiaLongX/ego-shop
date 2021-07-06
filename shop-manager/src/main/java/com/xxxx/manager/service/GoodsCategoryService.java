package com.xxxx.manager.service;


import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.pojo.GoodsCategory;
import com.xxxx.manager.pojo.vo.GoodsCategoryVo;

import java.util.List;

public interface GoodsCategoryService {

    List<GoodsCategory> queryListById(Short parentId);

    List<GoodsCategoryVo> quertAll();


    BaseResult addOne(GoodsCategory goodsCategory);
}
