package com.mgr.merry.admin;

import java.text.NumberFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mgr.merry.admin.model.vo.AdminCalendar;

@Controller
public class AdminController {

	//log
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	// main -> 관리자 뷰로드
	@RequestMapping("/admin/adminMain")
	public String adminMainPage(Model model) {
		
		// 테스트 달력 데이터 출력해보자
		AdminCalendar ac = new AdminCalendar();
		ac.setTitle("test cal");
		//1570233600000
		ac.setStart("1570233600000");
		//1570320000000
		ac.setEnd("1570320000000");
		ac.setClassName("bg-danger");
		
		model.addAttribute("ac", ac);
		
		return "admin/adminMainPage";
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
