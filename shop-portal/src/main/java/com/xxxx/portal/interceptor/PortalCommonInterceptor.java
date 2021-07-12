package com.xxxx.portal.interceptor;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 全局拦截器
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Component
public class PortalCommonInterceptor implements HandlerInterceptor {

   @Value("${shop.order.url}")
   private String shopOrderUrl;

   //请求处理的方法之前执行
   //如果返回true，执行下一个拦截器或者目标程序，如果返回false，不执行下一个拦截器或者目标程序
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      //获取Application对象中的url地址
      ServletContext context = request.getSession().getServletContext();
      String orderUrl = (String) context.getAttribute("orderUrl");
      if (StringUtils.isEmpty(orderUrl)){
         context.setAttribute("orderUrl",shopOrderUrl);
      }
      return true;
   }

   //请求处理的方法之后执行
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

   }

   //处理后执行清理工作
   @Override
   public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
                               Exception ex) throws Exception {

   }
}