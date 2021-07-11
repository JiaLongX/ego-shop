package com.xxxx.manager.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.xxxx.common.result.BaseResult;
import com.xxxx.manager.service.CookieService;
import com.xxxx.sso.pojo.Admin;
import com.xxxx.sso.service.SSOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @see(功能介绍) : 用户Controller
 * @version(版本号) : 1.0
 * @author(创建人) : zhoubin
 * @since : JDK 1.8
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Reference(interfaceClass = SSOService.class)
	private SSOService ssoService;

    @Autowired
    private CookieService cookieService;

    /**
     * 用户登录
     *
     * @param admin
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public BaseResult login(Admin admin, HttpServletRequest request, HttpServletResponse response) {
        // 登录并生成票据
        String ticket = ssoService.login(admin);

        if (!StringUtils.isEmpty(ticket)) {
            // 如果票据生成成功，将票据写入cookie
            boolean result = cookieService.setCookie(request, response, ticket);
            // 将用户信息，添加至session中，用于页面返显
            request.getSession().setAttribute("user", admin);
            return result ? BaseResult.success() : BaseResult.error();
        }

        return BaseResult.error();
    }

    /**
     * 用户退出
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        //清除redis
        String ticket = cookieService.getCookie(request);
        ssoService.logout(ticket);
        //清除session
        request.getSession().removeAttribute("user");
        //清除cookie
        cookieService.deleteCookie(request,response);
        return "login";
    }
}