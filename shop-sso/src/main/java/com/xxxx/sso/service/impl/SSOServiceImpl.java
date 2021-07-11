package com.xxxx.sso.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.xxxx.sso.pojo.Admin;
import com.xxxx.sso.service.SSOService;
import org.springframework.stereotype.Component;

/**
 * 单点登录服务实现类
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Service(interfaceClass = SSOService.class)
@Component
public class SSOServiceImpl implements SSOService {

   /**
    * 登录认证方法返回票据ticket
    * @param admin
    * @return
    */
   @Override
   public String login(Admin admin) {
      return null;
   }

   /**
    * 验证票据ticket返回用户信息
    * @param ticket
    * @return
    */
   @Override
   public Admin validate(String ticket) {
      return null;
   }
}