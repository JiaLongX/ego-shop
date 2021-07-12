package com.xxxx.portal.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 订单
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Controller
@RequestMapping("order")
public class OrderController {


   /**
    * 跳转订单系统
    * @param request
    * @return
    */
   @RequestMapping("toPreOrder")
   public String toPreOrder(HttpServletRequest request){
      String orderUrl = (String) request.getSession().getServletContext().getAttribute("orderUrl");
      System.out.println(orderUrl);
      return "redirect:"+request.getSession().getServletContext().getAttribute("orderUrl")+"order/preOrder";
   }
}