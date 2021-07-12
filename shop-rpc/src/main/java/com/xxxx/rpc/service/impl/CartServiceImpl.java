package com.xxxx.rpc.service.impl;


import com.alibaba.dubbo.config.annotation.Service;
import com.xxxx.common.result.BaseResult;
import com.xxxx.common.utils.JsonUtil;
import com.xxxx.rpc.pojo.CartResult;
import com.xxxx.rpc.pojo.vo.CartVo;
import com.xxxx.rpc.service.CartService;
import com.xxxx.sso.pojo.Admin;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service(interfaceClass = CartService.class)
@Component
public class CartServiceImpl implements CartService {

    @Resource
    private RedisTemplate redisTemplate;

    @Value("${user.cart}")
    private String userCart;

    private HashOperations<String, String, String> hashOperations = null;

    @Override
    public BaseResult addCart(CartVo cart, Admin admin) {
        if (admin!=null&&admin.getAdminId()!=null) {
            Short adminId = admin.getAdminId();
            hashOperations=redisTemplate.opsForHash();
            Map<String, String> car = hashOperations.entries(userCart+":"+adminId);
            if (!CollectionUtils.isEmpty(car)) {
                String s = car.get(String.valueOf(cart.getGoodsId()));
                if (!StringUtils.isEmpty(s)) {
                    cart.setGoodsNum(cart.getGoodsNum()+ JsonUtil.jsonStr2Object(s,CartVo.class).getGoodsNum());
                }
            }else {
                car=new HashMap<>();
            }
            car.put(String.valueOf(cart.getGoodsId()),JsonUtil.object2JsonStr(cart));
            hashOperations.putAll(userCart+":"+adminId,car);
            return BaseResult.success();
        }
       return BaseResult.error();
    }

    @Override
    public Integer getCartNum(Admin admin) {
        Integer result=0;
        if (admin!=null&&admin.getAdminId()!=null){
            hashOperations = redisTemplate.opsForHash();
            Map<String, String> car = hashOperations.entries(userCart + ":" + admin.getAdminId());
            if (!CollectionUtils.isEmpty(car)) {
                result = car.values().stream().mapToInt(e -> {
                    CartVo cartVo = JsonUtil.jsonStr2Object(e, CartVo.class);
                    return cartVo.getGoodsNum();
                }).sum();
            }
        }
        return result;
    }

    @Override
    public CartResult getCartList(Admin admin) {
        CartResult cartResult = null;
        if (admin!=null&&admin.getAdminId()!=null){
            List<CartVo> cartVoList=null;
            BigDecimal totalPrice=new BigDecimal(0);
            hashOperations=redisTemplate.opsForHash();
            Map<String, String> car = hashOperations.entries(userCart+":"+admin.getAdminId());
            if (!CollectionUtils.isEmpty(car)){
                cartVoList=new ArrayList<>();
                cartResult=new CartResult();
                for (Map.Entry<String, String> entry : car.entrySet()) {
                    CartVo cartVo = JsonUtil.jsonStr2Object(entry.getValue(), CartVo.class);
                    cartVoList.add(cartVo);
                    BigDecimal singePrice =
                            cartVo.getMarketPrice().multiply(new BigDecimal(String.valueOf(cartVo.getGoodsNum())));
                    totalPrice = totalPrice.add(singePrice);
                }
                cartResult.setCartList(cartVoList);
                totalPrice.setScale(2, BigDecimal.ROUND_HALF_UP);
                cartResult.setTotalPrice(totalPrice);
            }
        }
        return cartResult;
    }

    @Override
    public BaseResult clearCart(Admin admin) {
        if (admin!=null&&admin.getAdminId()!=null){
            redisTemplate.delete(userCart+":"+admin.getAdminId());
            return BaseResult.success();
        }
        return BaseResult.error();
    }
}
