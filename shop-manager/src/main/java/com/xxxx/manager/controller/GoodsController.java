package com.xxxx.manager.controller;

import com.xxxx.common.result.BaseResult;
import com.xxxx.common.result.FileResult;
import com.xxxx.manager.pojo.Brand;
import com.xxxx.manager.pojo.Goods;
import com.xxxx.manager.pojo.GoodsCategory;
import com.xxxx.manager.pojo.GoodsImages;
import com.xxxx.manager.pojo.vo.GoodsCategoryVo;
import com.xxxx.manager.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("goods")
public class GoodsController {

    @Resource
    private GoodsCategoryService goodsCategoryService;

    @Resource
    private GoodsService goodsService;

    @Resource
    private BrandService brandService;

    @Resource
    private UploadService uploadService;

    @Resource
    private GoodsImagesService goodsImagesService;

    /**
     * 商品分类-添加-页面跳转
     * @return
     */
    @RequestMapping("category/add")
    public String categoryAdd(Model model){
        List<GoodsCategory> goods= goodsCategoryService.queryListById((short) 0);
        model.addAttribute("gcList",goods);
        return "goods/category/category-add";
    }

    /**
     * 商品分类-列表-页面跳转
     * @return
     */
    @RequestMapping("category/list")
    public String categoryList(Model model){
        List<GoodsCategoryVo> goodsCategoryVoList=goodsCategoryService.quertAll();
        model.addAttribute("gcvList",goodsCategoryVoList);
        return "goods/category/category-list";
    }

    @RequestMapping("category/{parentId}")
    @ResponseBody
    public List<GoodsCategory> queryListById(@PathVariable Short parentId){
        return goodsCategoryService.queryListById(parentId);
    }

    @RequestMapping("category/save")
    @ResponseBody
    public BaseResult addOne(GoodsCategory goodsCategory){
        return goodsCategoryService.addOne(goodsCategory);
    }

    @RequestMapping("list")
    public String queryAll(Model model){
        List<GoodsCategory> goodsCategories=goodsCategoryService.queryAll();
        List<Brand> brands = brandService.queryAllBrand();
        model.addAttribute("gcList", goodsCategories);
        model.addAttribute("brandList", brands);
        return "goods/goods-list";
    }

    @RequestMapping("add")
    public String addGoods(Model model){
        List<GoodsCategory> goodsCategories = goodsCategoryService.queryListById((short) 0);
        List<Brand> brands=brandService.queryAllBrand();
        model.addAttribute("gcList",goodsCategories);
        model.addAttribute("brandList",brands);
        return "goods/goods-add";
    }

    @RequestMapping("save")
    @ResponseBody
    public BaseResult addOne(Goods goods){
        return goodsService.addOne(goods);
    }

    @RequestMapping("images/save")
    @ResponseBody
    public BaseResult addImages(MultipartFile file, Integer goodsId){
        try {
            FileResult fileResult = uploadService.upload(file);
            //判断图片是否上传成功
            if (!StringUtils.isEmpty(fileResult.getFileUrl())) {
                GoodsImages goodsImages = new GoodsImages();
                goodsImages.setGoodsId(goodsId);
                goodsImages.setImageUrl(fileResult.getFileUrl());
                System.out.println(goodsImages);
                return goodsImagesService.saveGoodsImages(goodsImages);
            }
        } catch (IOException ignored) {

        }
        return BaseResult.error();
    }

    /**
     * 商品-列表-分页查询
     * @param goods
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("listForPage")
    @ResponseBody
    public BaseResult selectGoodsListByPage(Goods goods,Integer pageNum,Integer pageSize){
        return goodsService.selectGoodsListByPage(goods,pageNum,pageSize);
    }



}
