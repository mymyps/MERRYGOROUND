package com.mgr.merry.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// pom -> xml 등록 -> 진행
public class LoggerInterceptor extends HandlerInterceptorAdapter{
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.debug("================start==================");
		log.debug(request.getRequestURI());
		log.debug("---------------------------------------");
		//로그인시에만 dev등록 및 목록조회를 할수있게 수정
		if(request.getSession().getAttribute("loginMember")==null) {
			request.setAttribute("msg", "로그인 후 이용하세요!");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			.forward(request, response);
			return false;			
		}else {
			log.debug("로그인했으니깐 진행해!!");
			return super.preHandle(request, response, handler);
		}
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	

}
