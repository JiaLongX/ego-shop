package com.xxxx.sso.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.xxxx.common.result.BaseResult;
import com.xxxx.common.utils.JsonUtil;
import com.xxxx.common.utils.Md5Util;
import com.xxxx.common.utils.UUIDUtil;
import com.xxxx.sso.mapper.AdminMapper;
import com.xxxx.sso.pojo.Admin;
import com.xxxx.sso.pojo.AdminExample;
import com.xxxx.sso.service.SSOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 单点登录服务实现类
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Service(interfaceClass = SSOService.class)
@Component
public class SSOServiceImpl implements SSOService {

   @Autowired
   private AdminMapper adminMapper;
   @Autowired
   private RedisTemplate<String, String> redisTemplate;
   @Value("${user.ticket}")
   private String userTicket;

   /**
    * 登录认证方法返回票据ticket
    * @param admin
    * @return
    */
   @Override
   public String login(Admin admin) {
      if (!StringUtils.isEmpty(admin.getUserName())&&!StringUtils.isEmpty(admin.getPassword())){
         AdminExample adminExample = new AdminExample();
         adminExample.createCriteria().andUserNameEqualTo(admin.getUserName());
         List<Admin> admins = adminMapper.selectByExample(adminExample);
         if (!CollectionUtils.isEmpty(admins)&&admins.size()==1) {
            Admin admin1 = admins.get(0);
            if (admin1.getPassword().equals(Md5Util.getMd5WithSalt(admin.getPassword(),admin1.getEcSalt()))){
               String ticket = UUIDUtil.getUUID();
               ValueOperations<String, String> opsForValue = redisTemplate.opsForValue();
               opsForValue.set(userTicket+":"+ticket, JsonUtil.object2JsonStr(admin1),30, TimeUnit.MINUTES);
               return ticket;
            }
         }
      }
      return null;
   }

   /**
    * 验证票据ticket返回用户信息
    * @param ticket
    * @return
    */
   @Override
   public Admin validate(String ticket) {
      if (!StringUtils.isEmpty(ticket)) {
         ValueOperations<String, String> opsForValue = redisTemplate.opsForValue();
         String s = opsForValue.get(userTicket + ":" + ticket);
         if (!StringUtils.isEmpty(s)) {
            return JsonUtil.jsonStr2Object(s,Admin.class);
         }
      }
      return null;
   }

   @Override
   public void logout(String ticket) {
      redisTemplate.delete(userTicket+":"+ticket);
   }

   @Override
   public BaseResult addUser(Admin admin) {

      return adminMapper.addUser(admin.getUserName(),admin.getPassword())>0?BaseResult.success():BaseResult.error();
   }

}