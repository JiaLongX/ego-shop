package com.xxxx.portal.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CookieService {
    boolean setCookie(HttpServletRequest request, HttpServletResponse response, String ticket);
    /**
     * 获取cookie
     * @param request
     * @return
     */
    String getCookie(HttpServletRequest request);

    /**
     * 删除cookie
     * @param request
     * @param response
     * @return
     */
    boolean deleteCookie(HttpServletRequest request, HttpServletResponse response);
}
