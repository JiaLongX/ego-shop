package com.xxxx.manager.interceptor;

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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;

/**
 * 后台登录拦截器
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Component
public class ManagerLoginInterceptor implements HandlerInterceptor {

   @Reference(interfaceClass = SSOService.class)
   private SSOService ssoService;

   @Value("${user.ticket}")
   private String userTicket;

   @Autowired
   private RedisTemplate<String, String> redisTemplate;

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      String ticket = CookieUtil.getCookieValue(request, "userTicket");
      if (!StringUtils.isEmpty(ticket)){
         Admin admin = ssoService.validate(ticket);
         if (admin!=null){
            request.getSession().setAttribute("user",admin);
            redisTemplate.opsForValue().set(userTicket+":"+ticket, JsonUtil.object2JsonStr(admin),30,TimeUnit.MINUTES);
            return true;
         }
      }
      request.getSession().removeAttribute("user");
      response.sendRedirect(request.getContextPath()+"/login");
      return false;
   }
}