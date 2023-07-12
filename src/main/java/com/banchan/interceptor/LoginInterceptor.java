package com.banchan.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	HttpSession session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle()....");

		String sPath = request.getServletPath();
		log.info("preHandle()....{}", sPath);

		String user_id = (String) session.getAttribute("user_id");
		log.info("preHandle()....user_id : {}", user_id);

		if (sPath.equals("/m_selectAll.do")) {
			if (user_id == null) {
				log.info("계정이 null입니다");
				response.sendRedirect("login.do");
				return false;
			}

			if (!user_id.equals("admin")) {
				log.info("admin계정이 아닙니다.");
				response.sendRedirect("home");
				return false;
			}
		}
		if (sPath.equals("/c_insertOK.do") // 장바구니 넣기
				|| sPath.equals("/c_selectAll.do") // 장바구니 목록
				|| sPath.equals("/re_selectAll.do")) { // 나의 리뷰 리스트
			
			if (user_id == null) {
				response.sendRedirect("login.do");
				return false;
			}
			
		}

		return true;
	}
}// end class
