package com.xxxx.manager.service.impl;

import com.xxxx.manager.mapper.BrandMapper;
import com.xxxx.manager.pojo.Brand;
import com.xxxx.manager.pojo.BrandExample;
import com.xxxx.manager.service.BrandService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BrandServiceImpl implements BrandService {

    @Resource
    private BrandMapper brandMapper;

    @Override
    public List<Brand> queryAllBrand() {
        return brandMapper.selectByExample(new BrandExample());
    }
}
