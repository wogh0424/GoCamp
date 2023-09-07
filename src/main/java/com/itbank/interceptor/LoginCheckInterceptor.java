package com.itbank.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("isAuthenticated : " + auth.isAuthenticated());
		System.out.println(auth.getName());
		System.out.println(auth.getPrincipal());
		if (auth.getName() != "anonymoususer") {
			System.out.println("로그인 되어 있음을 확인");
			return true;
		}
		String requestURL = request.getRequestURL().toString();
		requestURL = URLEncoder.encode(requestURL, "UTF-8");
		
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/login/loginForm?url=" + requestURL);
		System.out.println("로그인페이지로 이동");
		return false;
	}
}


