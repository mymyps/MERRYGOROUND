package com.mgr.merry.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mgr.merry.admin.model.service.AdminService;
import com.mgr.merry.admin.model.vo.AdminCalendar;

@Controller
public class AdminController {

	//log
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	AdminService service;
	
	// main -> 관리자 뷰로드
	@RequestMapping("/admin/adminMain")
	public String adminMainPage(Model model) {
		
		List<AdminCalendar> calList = new ArrayList<AdminCalendar>();
		
		// 기본 달력 이벤트 로드
		calList = service.calLoad();
		model.addAttribute("ac", calList);
		return "admin/adminMainPage";
	}
	
	// calendar 저장
	@RequestMapping("/admin/calSave.do")
	public void calSave(AdminCalendar calTmp, HttpServletResponse res) throws IOException {
		//비지니스 로직
		int result = service.calSave(calTmp);
		log.debug("성공여부 : " + result);
		
		res.getWriter().print(true);
	}
	// calendar 수정
	@RequestMapping("/admin/calMod.do")
	public void calMod(AdminCalendar calTmp, HttpServletResponse res) throws IOException  {
		System.out.println(calTmp);
		int result = service.calMod(calTmp);
		log.debug("수정 여부 : " + result);
		res.getWriter().print(true);
	}
	
	// calendar 삭제
	@RequestMapping("/admin/calDel.do")
	public void calDel(AdminCalendar calTmp, HttpServletResponse res) throws IOException  {
		int result = service.calDel(calTmp);
		log.debug("삭제 여부 : " + result);
		res.getWriter().print(true);
	}
	

	//메인페이지 로드
	@RequestMapping("/admin/adminIndex")
	public String mainIndex() {
		return "/";
	}
	
	
	//게시글 뷰 로드
	@RequestMapping("/admin/board")
	public String boardPage() {
		return "admin/board";
	}
	
	//서포터즈 글 뷰 로드
	@RequestMapping("/admin/supBoard")
	public String subBoard() {
		return "admin/supBoard";
	}
	
	//서포터즈 리스트 뷰 로드
	@RequestMapping("/admin/supportersList")
	public String supportersList() {
		return "admin/supportersList";
	}
	
	//서포터즈 후원 뷰 로드
	@RequestMapping("/admin/supportersPay")
	public String supportersPay() {
		return "admin/supportersPay";
	}
	
	// 유저 관리뷰 로드
	@RequestMapping("/admin/users")
	public String users() {
		return "admin/users";
	}
	
	//지역 관리 뷰 로드
	@RequestMapping("/admin/location")
	public String location() {
		return "admin/location";
	}
	
	//테마 관리 뷰 로드
	@RequestMapping("/admin/thema")
	public String thema() {
		return "amdin/thema";
	}
	
	//승인 뷰 로드
	@RequestMapping("/admin/celtify")
	public String celtify() {
		return "admin/celtify";
	}
	
	
}