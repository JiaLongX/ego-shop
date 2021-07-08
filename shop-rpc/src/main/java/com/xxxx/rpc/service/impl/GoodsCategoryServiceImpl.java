package com.xxxx.rpc.service.impl;


import com.alibaba.dubbo.config.annotation.Service;
import com.xxxx.common.utils.JsonUtil;
import com.xxxx.rpc.mapper.GoodsCategoryMapper;
import com.xxxx.rpc.pojo.GoodsCategory;
import com.xxxx.rpc.pojo.GoodsCategoryExample;
import com.xxxx.rpc.pojo.vo.GoodsCategoryVo;
import com.xxxx.rpc.service.GoodsCategoryService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service(interfaceClass = GoodsCategoryService.class)
@Component
public class GoodsCategoryServiceImpl implements GoodsCategoryService {

    @Resource
    private GoodsCategoryMapper goodsCategoryMapper;

    @Resource
    private RedisTemplate redisTemplate;

    @Value("${goods.category.list.key}")
    private String goodsCategoryListKey;


    @Override
    public List<GoodsCategoryVo> quertAll() {
        ValueOperations valueOperations = redisTemplate.opsForValue();
        Object o = valueOperations.get(goodsCategoryListKey);
        if (o!=null){
            return JsonUtil.jsonToList((String) o,GoodsCategoryVo.class);
        }
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
        valueOperations.set(goodsCategoryListKey,JsonUtil.object2JsonStr(voList));
        return voList;
    }



}
