package com.xxxx.portal.service.impl;

import com.xxxx.common.utils.CookieUtil;
import com.xxxx.portal.service.CookieService;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class CookieServiceImpl implements CookieService {
    @Override
    public boolean setCookie(HttpServletRequest request, HttpServletResponse response, String ticket) {
        try {
//            CookieUtil.setCookie(request,response,"userTicket",ticket);
            Cookie userTicket = new Cookie("userTicket", ticket);
            userTicket.setPath("/");
            userTicket.setMaxAge(3000);
            response.addCookie(userTicket);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 获取cookie
     * @param request
     * @return
     */
    @Override
    public String getCookie(HttpServletRequest request) {
        return CookieUtil.getCookieValue(request,"userTicket");
    }

    /**
     * 删除cookie
     * @param request
     * @param response
     * @return
     */
    @Override
    public boolean deleteCookie(HttpServletRequest request, HttpServletResponse response) {
        try {
//            CookieUtil.deleteCookie(request,response,"userTicket");
            Cookie ck=null;
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if ("userTicket".equals(cookie.getName())){
                    ck=new Cookie(cookie.getName(),null);
                }
            }
            ck.setMaxAge(0);
            ck.setPath("/");
            response.addCookie(ck);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
