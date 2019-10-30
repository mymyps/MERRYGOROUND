package com.mgr.merry.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView adminMainPage() {
		
		ModelAndView mv = new ModelAndView();
		List<AdminCalendar> calList = new ArrayList<AdminCalendar>();
		
		// 기본 달력 이벤트 로드
		calList = service.calLoad();
		mv.addObject("ac", calList);
		
		//메인화면 테마별 글 조회
		List<Map<String, String>> themaListMain = service.adminThemaMain();
		mv.addObject("mainThema", themaListMain);
		
		//테마별 조회 데이터
		double rto = 0;
		for (Map<String, String> m : themaListMain) {
			String tmp = String.valueOf(m.get("COUNT"));
			rto += Integer.parseInt(tmp);
		}
		rto = rto/100;
		log.debug("result count : "+ rto);
		mv.addObject("rto", rto);
		
		//상단 총 데이터 집계
		int topResult = service.topInfoUpload();
		int topSupporters = service.topSupporters();
		int topSupStatus = service.topSupStatus();
		int topCouple = service.topCouple();
		log.debug(""+topResult + " / " + topSupporters + " / " + topSupStatus + " / " + topCouple);
		mv.addObject("topResult", topResult);
		mv.addObject("topSupporters", topSupporters);
		mv.addObject("topSupStatus", topSupStatus);
		mv.addObject("topCouple", topCouple);
		
		// 게시글 추천(top5)
		List<Map<String, String>> uploadTop5 = service.uploadTop();
		List<Map<String, String>> supPayMain5 = service.supPayMain();
		mv.addObject("uploadTop5", uploadTop5);
		mv.addObject("supPayMain5", supPayMain5);
		
		// 서포터즈 리스트
		List<Map<String, String>> supListMain = service.supListMain();
		mv.addObject("supListMain", supListMain);
		
		// 서포터즈 신청 리스트
		List<Map<String, String>> supConfirmMain = service.supConfirmMain();
		mv.addObject("supConfirmMain", supConfirmMain);
		
		// 업로드 글 리스트
		List<Map<String, String>> infoUploadMain = service.infoUploadMain();
		mv.addObject("infoUploadMain", infoUploadMain);
		
		//-----------------------------------//
		mv.setViewName("admin/adminMainPage");
		
		return mv;
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
	public ModelAndView boardPage() {

		// 전체글 조회
		List<Map<String, String>> list = service.boardPage(); 
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("admin/board");
		
		return mv;
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