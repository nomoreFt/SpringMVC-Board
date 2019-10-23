package com.or.petspital.reserve.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemLoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
		
		if(session != null) { //세션이 존재할 경우
			
			Object coupon = session.getAttribute("coupon");
			if(coupon != null) return true;
			
			Object login = session.getAttribute("memLoginOk");
			if(login != null) return true; //로그인 세션이 존재할 경우
			
		}
		response.sendRedirect(request.getContextPath()+"/member/memberlogin");
		return false;
	}
	
}
