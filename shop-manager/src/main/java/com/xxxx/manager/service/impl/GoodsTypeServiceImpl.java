package com.xxxx.manager.service.impl;

import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.mapper.GoodsTypeMapper;
import com.xxxx.manager.pojo.GoodsType;
import com.xxxx.manager.pojo.GoodsTypeExample;
import com.xxxx.manager.service.GoodsTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {

    @Resource
    private GoodsTypeMapper goodsTypeMapper;

    @Override
    public List<GoodsType> queryAll() {
        return goodsTypeMapper.selectByExample(new GoodsTypeExample());
    }

    @Override
    public BaseResult addType(GoodsType goodsType) {
        return goodsTypeMapper.insertSelective(goodsType)>0?BaseResult.success():BaseResult.error();
    }

    @Override
    public BaseResult delType(Short id) {
        return goodsTypeMapper.deleteByPrimaryKey(id)>0?BaseResult.success():BaseResult.error();
    }
}
