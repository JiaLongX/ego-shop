package com.xxxx.order.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.xxxx.common.result.BaseResult;
import com.xxxx.order.service.OrderService;
import com.xxxx.rpc.pojo.CartResult;
import com.xxxx.rpc.service.CartService;
import com.xxxx.sso.pojo.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;

/**
 * 订单Controller
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Controller
@RequestMapping("order")
public class OrderController {

   @Reference(interfaceClass = CartService.class)
   private CartService cartService;

   @Resource
   private OrderService orderService;

   /**
    * 跳转到预订单页面
    * @return
    */
   @RequestMapping("preOrder")
   public String preOrder(Model model, HttpServletRequest request){
      Admin admin = (Admin) request.getSession().getAttribute("user");
      model.addAttribute("cartResult",cartService.getCartList(admin));
      return "order/preOrder";
   }

   /**
    * 订单提交成功页面
    * @return
    */
   @RequestMapping("submitOrder")
   public String toSubmitOrder(HttpServletRequest request,Model model){
      //获取用户信息
      Admin admin = (Admin) request.getSession().getAttribute("user");
      CartResult cartResult = cartService.getCartList(admin);
      BigDecimal totalPrice = cartResult.getTotalPrice();
      //存入订单信息
      BaseResult baseResult = orderService.orderSave(admin, cartResult);
      //购物车清空
      cartService.clearCart(admin);
      //设置订单编号
      model.addAttribute("orderSn",baseResult.getMessage());
      //设置总价
      model.addAttribute("totalPrice",totalPrice);
      return "order/submitOrder";
   }
}