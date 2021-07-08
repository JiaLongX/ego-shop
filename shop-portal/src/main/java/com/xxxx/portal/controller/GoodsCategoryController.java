package com.xxxx.portal.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.xxxx.rpc.pojo.vo.GoodsCategoryVo;
import com.xxxx.rpc.service.GoodsCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 商品Controller
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Controller
@RequestMapping("goodsCategory")
public class GoodsCategoryController {

   @Reference(interfaceClass = GoodsCategoryService.class,parameters = {"unicast","false"})
   private GoodsCategoryService goodsCategoryService;

   /**
    * 查询商品分类列表
    *
    * @return
    */
   @RequestMapping("list")
   @ResponseBody
   public List<GoodsCategoryVo> categoryList() {
      return goodsCategoryService.quertAll();
   }
}