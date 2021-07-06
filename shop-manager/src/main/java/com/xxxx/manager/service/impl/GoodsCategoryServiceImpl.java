package com.xxxx.manager.service.impl;



import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.mapper.GoodsCategoryMapper;
import com.xxxx.manager.pojo.GoodsCategory;
import com.xxxx.manager.pojo.GoodsCategoryExample;
import com.xxxx.manager.pojo.vo.GoodsCategoryVo;
import com.xxxx.manager.service.GoodsCategoryService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class GoodsCategoryServiceImpl implements GoodsCategoryService {

    @Resource
    private GoodsCategoryMapper goodsCategoryMapper;

    @Override
    public List<GoodsCategory> queryListById(Short parentId) {
        // 创建查询对象
        GoodsCategoryExample example = new GoodsCategoryExample();
        // where条件
        example.createCriteria().andParentIdEqualTo(parentId);
        return goodsCategoryMapper.selectByExample(example);
    }

    @Override
    public List<GoodsCategoryVo> quertAll() {
        GoodsCategoryExample example = new GoodsCategoryExample();
        example.createCriteria().andParentIdEqualTo((short) 0);
        List<GoodsCategory> list = goodsCategoryMapper.selectByExample(example);
        List<GoodsCategoryVo> voList=new ArrayList<>();
        for (GoodsCategory goodsCategory : list) {
            GoodsCategoryVo goodsCategoryVo=new GoodsCategoryVo();
            BeanUtils.copyProperties(goodsCategory,goodsCategoryVo);
            example.clear();
            example.createCriteria().andParentIdEqualTo(goodsCategoryVo.getId()).andLevelEqualTo(2);
            List<GoodsCategory> list1 = goodsCategoryMapper.selectByExample(example);
            List<GoodsCategoryVo> voList1=new ArrayList<>();
            for (GoodsCategory category : list1) {
                GoodsCategoryVo goodsCategoryVo1 = new GoodsCategoryVo();
                BeanUtils.copyProperties(category,goodsCategoryVo1);
                example.clear();
                example.createCriteria().andParentIdEqualTo(goodsCategoryVo1.getId()).andLevelEqualTo(3);
                List<GoodsCategory> list2 = goodsCategoryMapper.selectByExample(example);
                List<GoodsCategoryVo> voList2=new ArrayList<>();
                for (GoodsCategory goodsCategory1 : list2) {
                    GoodsCategoryVo goodsCategoryVo2 = new GoodsCategoryVo();
                    BeanUtils.copyProperties(goodsCategory1,goodsCategoryVo2);
                    voList2.add(goodsCategoryVo2);
                }
                goodsCategoryVo1.setChildren(voList2);
                voList1.add(goodsCategoryVo1);
            }
            goodsCategoryVo.setChildren(voList1);
            voList.add(goodsCategoryVo);
        }
        return voList;
    }

    @Override
    public BaseResult addOne(GoodsCategory goodsCategory) {
        return goodsCategoryMapper.insertSelective(goodsCategory)>0?BaseResult.success():BaseResult.error();
    }


}
