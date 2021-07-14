package com.xxxx.order.service.impl;


import com.xxxx.common.result.BaseResult;
import com.xxxx.order.mapper.OrderGoodsMapper;
import com.xxxx.order.mapper.OrderMapper;
import com.xxxx.order.pojo.Order;
import com.xxxx.order.pojo.OrderGoods;
import com.xxxx.order.service.OrderService;
import com.xxxx.rpc.pojo.CartResult;
import com.xxxx.rpc.pojo.vo.CartVo;
import com.xxxx.sso.pojo.Admin;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper orderMapper;
    @Resource
    private OrderGoodsMapper orderGoodsMapper;
    @Resource
    private RedisTemplate<String, Object> redisTemplate;
    @Value("${redis.order.increment}")
    private String redisOrderIncrement;
    @Override
    public BaseResult orderSave(Admin admin, CartResult cartResult) {
        BaseResult baseResult=BaseResult.error();
        if (admin!=null&&admin.getAdminId()!=null){
            List<CartVo> cartList = cartResult.getCartList();
            if (!CollectionUtils.isEmpty(cartList)) {
                Order order = new Order();
                order.setUserId(Integer.valueOf(admin.getAdminId()));
                String sn = DateTimeFormatter.ofPattern("yyyyMMddHHmmss").format(LocalDateTime.now());
                order.setOrderSn(sn);
                int i = orderMapper.insertSelective(order);
                if (i>0){
                    List<OrderGoods> orderGoodsList=new ArrayList<>();
                    for (CartVo cartVo : cartList) {
                        OrderGoods orderGoods = new OrderGoods();
                        orderGoods.setGoodsId(cartVo.getGoodsId());
                        orderGoods.setGoodsName(cartVo.getGoodsName());
                        orderGoods.setOrderId(order.getOrderId());
                        orderGoodsList.add(orderGoods);
                    }
                    int row=orderGoodsMapper.insertMore(orderGoodsList);
                    if (row>0){
                        baseResult=BaseResult.success();
                        baseResult.setMessage(String.valueOf(order.getOrderSn()));
                    }
                }
            }
        }
        return baseResult;
    }
}
