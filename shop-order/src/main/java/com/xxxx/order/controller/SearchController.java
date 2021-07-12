package com.xxxx.order.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.xxxx.common.result.ShopPageInfo;
import com.xxxx.rpc.pojo.GoodsVo;
import com.xxxx.rpc.service.SearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("search")
public class SearchController {

    @Reference(interfaceClass = SearchService.class)
    private SearchService searchService;

    @RequestMapping("index")
    public String toIndex(String searchStr, Model model){
        model.addAttribute("searchStr",searchStr);
        return "search/doSearch";
    }

    /**
     * 搜索商品
     * @param searchStr
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("searchGoods")
    @ResponseBody
    public ShopPageInfo<GoodsVo> searchGoods(String searchStr, Integer pageNum, Integer pageSize){
        return searchService.test(searchStr,pageNum,pageSize);
    }
}