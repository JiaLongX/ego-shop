package com.xxxx.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 跳转页面
 *
 * @author zhoubin
 * @since 1.0.0
 */
@Controller
public class PageController {
	/**
	 * 公共页面跳转 restful风格
	 * 比如：前台传welcome就跳转至/WEB-INF/pages/welcome.ftl
	 * 比如：前台传login就跳转至/WEB-INF/pages/login.ftl
	 * ...
	 * @param page
	 * @return
	 */
	@RequestMapping("/{page}")
	public String page(@PathVariable String page) {
		System.out.println(page);
		return page;
	}

	/**
	 * 跳转首页
	 *
	 * @return
	 */
	@RequestMapping("/")
	public String index() {
		return "index";
	}
}