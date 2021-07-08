package com.xxxx.portal.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
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

    @RequestMapping("tosearch")
    public String toSearch(String searchStr,Model model){
        model.addAttribute("searchStr",searchStr);
        return "search/doSearch";
    }

    @RequestMapping("searchGoods")
    @ResponseBody
    public ShopPageInfo<GoodsVo> Search(String searchStr, Integer pageNum, Integer pageSize){
        ShopPageInfo<GoodsVo> test = searchService.test(searchStr, pageNum, pageSize);
        return test;
    }
}
