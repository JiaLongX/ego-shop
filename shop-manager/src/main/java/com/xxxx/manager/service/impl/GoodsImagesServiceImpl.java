package com.xxxx.manager.service.impl;

import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.mapper.GoodsImagesMapper;
import com.xxxx.manager.pojo.GoodsImages;
import com.xxxx.manager.service.GoodsImagesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class GoodsImagesServiceImpl implements GoodsImagesService {

    @Resource
    private GoodsImagesMapper goodsImagesMapper;
    @Override
    public BaseResult saveGoodsImages(GoodsImages goodsImages) {
        return goodsImagesMapper.insertSelective(goodsImages)>0?BaseResult.success():BaseResult.error();
    }
}
