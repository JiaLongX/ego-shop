package com.xxxx.rpc.service;

import com.xxxx.common.result.BaseResult;
import com.xxxx.rpc.pojo.CartResult;
import com.xxxx.rpc.pojo.vo.CartVo;
import com.xxxx.sso.pojo.Admin;


/**
 * 购物车service
 */
public interface CartService {
   /**
    * 加入购物车
    * @param cart
    * @param admin
    * @return
    */
   BaseResult addCart(CartVo cart, Admin admin);
   
   /**
    * 获取购物车数量
    * @param admin
    * @return
    */
   Integer getCartNum(Admin admin);

   /**
    * 获取购物车列表
    * @param admin
    * @return
    */
   CartResult getCartList(Admin admin);

   /**
    * 清空购物车
    * @param admin
    * @return
    */
   BaseResult clearCart(Admin admin);
}