package com.xxxx.manager.service.impl;

import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.mapper.GoodsMapper;
import com.xxxx.manager.pojo.Goods;
import com.xxxx.manager.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private GoodsMapper goodsMapper;

    @Override
    public BaseResult addOne(Goods goods) {
        BaseResult baseResult=BaseResult.error();
        if (goods.getGoodsId()==null){
            if (goodsMapper.insertSelective(goods)>0){
                baseResult=BaseResult.success();
                baseResult.setMessage(String.valueOf(goods.getGoodsId()));
            }
        }
        return baseResult;
    }
}
