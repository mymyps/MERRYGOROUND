package com.mgr.merry.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	//log
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	// main -> 관리자 뷰로드
	@RequestMapping("/admin/adminMain")
	public String adminMainPage() {
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
