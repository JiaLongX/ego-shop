package com.xxxx.manager.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.mapper.GoodsMapper;
import com.xxxx.manager.pojo.Goods;
import com.xxxx.manager.pojo.GoodsExample;
import com.xxxx.manager.service.GoodsService;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.util.HtmlUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private GoodsMapper goodsMapper;

    @Resource
    private RedisTemplate redisTemplate;

    @Override
    public BaseResult addOne(Goods goods) {
        BaseResult baseResult=BaseResult.error();
        //如果有详情，先转义
        if (!StringUtils.isEmpty(goods.getGoodsContent())){
            goods.setGoodsContent(HtmlUtils.htmlEscape(goods.getGoodsContent(), "UTF-8"));
        }
        if (goods.getGoodsId()==null){
            redisTemplate.delete(redisTemplate.keys("goods*"));
            if (goodsMapper.insertSelective(goods)>0){
                baseResult=BaseResult.success();
                baseResult.setMessage(String.valueOf(goods.getGoodsId()));
            }
        }
        return baseResult;
    }

    @Override
    public BaseResult selectGoodsListByPage(Goods goods, Integer pageNum, Integer pageSize) {
        //构建分页对象
        PageHelper.startPage(pageNum,pageSize);
        //创建查询对象
        GoodsExample example = new GoodsExample();
        GoodsExample.Criteria criteria = example.createCriteria();
        //设置查询条件
        //分类参数
        if (null!=goods.getCatId()&&0!=goods.getCatId()){
            criteria.andCatIdEqualTo(goods.getCatId());
        }
        //品牌参数
        if (null!=goods.getBrandId()&&0!=goods.getBrandId()){
            criteria.andBrandIdEqualTo(goods.getBrandId());
        }
        //关键词
        if (!StringUtils.isEmpty(goods.getGoodsName())){
            criteria.andGoodsNameLike("%"+goods.getGoodsName()+"%");
        }
        //查询
        List<Goods> list = goodsMapper.selectByExample(example);
        //将查询结果设置至分页对象
        if (!CollectionUtils.isEmpty(list)){
            PageInfo<Goods> pageInfo = new PageInfo<>(list);
            return BaseResult.success(pageInfo);
        }
        return BaseResult.error();
    }
}
