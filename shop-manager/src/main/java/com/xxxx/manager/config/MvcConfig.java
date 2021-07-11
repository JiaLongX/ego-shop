package com.xxxx.manager.config;

import com.xxxx.manager.interceptor.ManagerLoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

/**
 * MVC配置类
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {

   @Resource
   private ManagerLoginInterceptor managerLoginInterceptor;

   /**
    * 放行静态资源
    *
    * @param registry
    */
   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
      registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
   }

   /**
    *  addInterceptor:添加自定义拦截器
    *  addPathPatterns：添加拦截请求 /**表示拦截所有
    *  excludePathPatterns：不拦截的请求
    * @param registry
    */
   @Override
   public void addInterceptors(InterceptorRegistry registry) {
      registry.addInterceptor(managerLoginInterceptor)
            .addPathPatterns("/**")
            .excludePathPatterns("/static/**")
            .excludePathPatterns("/login/**")
            .excludePathPatterns("/user/login/**")
            .excludePathPatterns("/user/logout/**");
   }
}