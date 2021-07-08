package com.xxxx.rpc.service.impl;


import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageInfo;
import com.xxxx.common.result.ShopPageInfo;
import com.xxxx.rpc.pojo.GoodsVo;
import com.xxxx.rpc.service.SearchService;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service(interfaceClass = SearchService.class)
@Component
public class SearchServiceImpl implements SearchService {

    @Resource
    private RestHighLevelClient client;

    @Override
    public ShopPageInfo<GoodsVo> test(String searchStr, Integer pageNum, Integer pageSize) {
        //构建分页对象
        ShopPageInfo<GoodsVo> pageInfo;
        try {
            //指定索引库
            SearchRequest searchRequest = new SearchRequest("shop");
            //构建查询对象
            SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
            //设置分页条件
            searchSourceBuilder.from((pageNum-1)*pageSize).size(pageSize);
            //构建高亮对象
            HighlightBuilder highlightBuilder = new HighlightBuilder();
            //设置高亮字段以及样式
            highlightBuilder.field("goodsName")
                    .preTags("<span style='color:red'>")
                    .postTags("</span>");
            //添加查询条件
            searchSourceBuilder.highlighter(highlightBuilder);
            searchSourceBuilder.query(QueryBuilders.multiMatchQuery(searchStr,"goodsName"));
            searchRequest.source(searchSourceBuilder);
            //执行请求
            SearchResponse response = null;
            response = client.search(searchRequest, RequestOptions.DEFAULT);
            //总条数
            Long value = response.getHits().getTotalHits().value;
            if (0>value){
                return null;
            }
            //数据
            SearchHit[] hits = response.getHits().getHits();
            List<GoodsVo> list=new ArrayList<>();
            for (SearchHit hit : hits) {
                Integer goodsId = (Integer) hit.getSourceAsMap().get("goodsId");
                String goodsName = (String) hit.getSourceAsMap().get("goodsName");
                String goodsNameHl = String.valueOf(hit.getHighlightFields().get("goodsName").fragments()[0]);
                BigDecimal marketPrice = new BigDecimal(String.valueOf(hit.getSourceAsMap().get("marketPrice")));
                String originalImg = String.valueOf(hit.getSourceAsMap().get("originalImg"));
                list.add(new GoodsVo(goodsId,goodsName,goodsNameHl,marketPrice,originalImg));
            }
            pageInfo = new ShopPageInfo<GoodsVo>(pageNum,pageSize,value.intValue());
            pageInfo.setResult(list);
            return pageInfo;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;

    }
}
