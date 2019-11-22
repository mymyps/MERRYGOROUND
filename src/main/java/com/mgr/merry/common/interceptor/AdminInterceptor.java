package com.mgr.merry.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mgr.merry.sign.model.vo.Members;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		
		log.debug("------ admin log ------");
		log.debug(req.getRequestURI());
		
		if(req.getSession().getAttribute("loginMember") == null) {
			req.setAttribute("msg", "login please");
			req.setAttribute("loc", "/");
			req.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(req, res);
			return false;
		}else {
			// 관리자 페이지 인터셉터 확인
			System.out.println("++++++++++++++++++++++");
			System.out.println( ((Members)req.getSession().getAttribute("loginMember")).getId().equals("admin") );
			//Members(memberNum=41, id=test, pw=
			System.out.println("++++++++++++++++++++++");
			log.debug("로긴은 됨");
			if(!((Members)req.getSession().getAttribute("loginMember")).getId().equals("admin")) {
				req.setAttribute("msg", "admin login please");
				req.setAttribute("loc", "/");
				req.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(req, res);
				return false;
			}else
				return super.preHandle(req, res, handler);
		}
		
	}
	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mv) throws Exception{
		super.postHandle(req, res, handler, mv);
	}

}
