package com.xxxx.portal.interceptor;

import com.alibaba.dubbo.config.annotation.Reference;

import com.xxxx.common.utils.CookieUtil;
import com.xxxx.common.utils.JsonUtil;
import com.xxxx.sso.pojo.Admin;
import com.xxxx.sso.service.SSOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;

/**
 * 前台登录拦截器
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Component
public class PortalLoginInterceptor implements HandlerInterceptor {

   @Reference(interfaceClass = SSOService.class)
   private SSOService ssoService;

   @Value("${user.ticket}")
   private String userTicket;

   private static final String COOKIE_NAME = "userTicket";

   @Autowired
   private RedisTemplate<String, String> redisTemplate;

   //请求处理的方法之前执行
   //如果返回true，执行下一个拦截器或者目标程序，如果返回false，不执行下一个拦截器或者目标程序
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      //获取用户名票据
      String ticket = CookieUtil.getCookieValue(request, COOKIE_NAME);
      if (!StringUtils.isEmpty(ticket)) {
         //如果票据存在，进行验证
         Admin admin = ssoService.validate(ticket);
         //将用户信息添加至session中，用于页面返显
         request.getSession().setAttribute("user", admin);
         //重新设置新的失效时间
         redisTemplate.opsForValue().set(userTicket + ":" + ticket, JsonUtil.object2JsonStr(admin), 30,
               TimeUnit.MINUTES);
         return true;
      }
      //票据不存在或者用户验证失败，重定向至登录页面
      response.sendRedirect(request.getContextPath() + "/login");
      return false;
   }

   //请求处理的方法之后执行
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                          ModelAndView modelAndView) throws Exception {

   }

   //处理后执行清理工作
   @Override
   public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
                               Exception ex) throws Exception {

   }
}