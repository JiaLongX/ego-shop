package com.xxxx.sso.service;

import com.xxxx.sso.pojo.Admin;

/**
 * 单点登录服务
 */
public interface SSOService {
   /**
    * 登录认证方法返回票据ticket
    * @param admin
    * @return
    */
   String login(Admin admin);

   /**
    * 验证票据ticket返回用户信息
    * @param ticket
    * @return
    */
   Admin validate(String ticket);
}