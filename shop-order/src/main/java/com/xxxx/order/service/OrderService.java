package com.xxxx.order.service;

import com.xxxx.common.result.BaseResult;
import com.xxxx.rpc.pojo.CartResult;
import com.xxxx.sso.pojo.Admin;
import org.springframework.stereotype.Service;


/**
 * 订单service
 */
@Service
public interface OrderService {
   /**
    * 生成订单
    * @param admin
    * @param cartResult
    * @return
    */
   BaseResult orderSave(Admin admin, CartResult cartResult);
}