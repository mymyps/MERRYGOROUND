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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
		
		// 공지사항 출력
		Map<String, String> adminNotice = service.adminNotice();
		mv.addObject("adminNotice", adminNotice);
		
		//-----------------------------------//
		mv.setViewName("admin/adminMainPage");
		
		return mv;
	}
	
	// calendar 드래그
	@RequestMapping("/admin/calDropSave.do")
	public void calDropSave(AdminCalendar calTmp, HttpServletResponse res) throws IOException {
		
		int result = service.calDropSave(calTmp);
		
		res.getWriter().print(true);
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
	public ModelAndView subBoard() {
		
		// 서포터즈 리뷰
		List<Map<String , String>> list = service.supBoard();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("admin/supBoard");
		
		return mv;
	}
	
	//서포터즈 리스트 뷰 로드
	@RequestMapping("/admin/supportersList")
	public ModelAndView supportersList() {
		
		List<Map<String , String>> list = service.supportersList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("admin/supportersList");
				
		return mv;
	}
	
	//서포터즈 후원 뷰 로드
	@RequestMapping("/admin/supportersPay")
	public ModelAndView supportersPay() {
		
		List<Map<String , String>> list = service.supportersPay();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("admin/supportersPay");
				
		return mv;
	}
	
	// 유저 관리뷰 로드
	@RequestMapping("/admin/users")
	public ModelAndView users() {
		
		List<Map<String , String>> list = service.users();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("admin/users");
				
		return mv;
	}
	
	//지역 관리 뷰 로드
	@RequestMapping("/admin/location")
	public ModelAndView location() {
		
		List<Map<String , String>> list = service.location();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("admin/location");
		
		return mv;
	}
	
	//테마 관리 뷰 로드
	@RequestMapping("/admin/thema")
	public ModelAndView thema() {
		
		List<Map<String , String>> list = service.thema();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("admin/thema");
		
		return mv;
	}
	
	//승인 뷰 로드
	@RequestMapping("/admin/celtify")
	public ModelAndView celtify() {
		
		List<Map<String , String>> list = service.celtify();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("admin/celtify");
		
		return mv;
	}
	
	// 테마추가(ajax)
	@RequestMapping("/admin/themaAdd.do")
	public void themaAdd(@RequestParam(value="strTmp") String strTmp, HttpServletResponse res) throws IOException {
		// 테마 확인후 추가
//		log.debug("=====  " + strTmp);
		
		// 테마가 있는지 확인
		int result = service.themaAdd(strTmp);
		log.debug(""+result);
		if(result > 0) {
			result = service.themaAddAdd(strTmp);
		}
		
		res.getWriter().print(true);
	}
	
	@RequestMapping("/admin/celtify.do")
	@ResponseBody
	public String cletifyAdmin(@RequestParam(value="memberNum") int memberNum) throws JsonProcessingException{
		//json(return type)
		Map<String, String> map = service.celtifyData(memberNum);
		
		//json 처리
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(map);
	}
	
	// 서포터즈 승인
	@RequestMapping("/admin/cletify.end")
	public void cletifyAdmin(@RequestParam(value="memberNum") int memberNum, HttpServletResponse res) throws IOException {
		
		// 맴버넘버를 통해 모달에 띄어줄내용을 받아와야함
		
		// 받아온 내용을 토대로 승인진행
		log.debug("value ==  " + memberNum);
		int result = service.cletifyAdmin(memberNum);
		log.debug("result ==  "+result);
		
		if (result > 0) {
			log.debug("true-->");
			res.getWriter().print(true);
		}
		else
			res.getWriter().print(false);
		
	}
	
	
	@RequestMapping("/admin/adminNoticeIn.do")
	@ResponseBody
	public String adminNoticeInsert(@RequestParam(value="strTmp") String strTmp, HttpServletResponse res) throws JsonProcessingException {

		ObjectMapper mapper = new ObjectMapper();
		
		//비지니스 로직처리(데이터 삽입)
		Map<String, String> map = service.adminNoticeInsert(strTmp);
		
		return mapper.writeValueAsString(map);
		
	}
	
		//한글
//		BoardService bService = new BoardServiceImpl();
//		mapper.readValue(json값, vo클래스)
//		List<Map<String, String>> list = bService.boardList(1, 5); 
		
//		return mapper.writeValueAsString(list);
	
	// notice view load
	@RequestMapping("/admin/notice")
	public ModelAndView adminNoticeList() {
		
		List<Map<String, String>> list = service.adminNoticeList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("admin/adminNotice");
		
		return mv;
	}
	
	@RequestMapping("/admin/adminNotiDel")
	public void adminNotiDel(@RequestParam(value="noticenum") String noticeNum, HttpServletResponse res) throws IOException {
		
		log.debug("" + noticeNum);
		//공지 하나 지우기
		int result = service.adminNotiDel(Integer.parseInt(noticeNum));
		
		if(result > 0) {
			res.getWriter().print(true);
		}else {
			res.getWriter().print(false);
		}
	}
	
	@RequestMapping("/admin/adminNotiMod")
	public void adminNotiMod(@RequestParam Map<String,String> param, HttpServletResponse res) throws IOException {
		
		System.out.println("====================");
		System.out.println("====================");
		System.out.println(param);
		
		int result = service.adminNotiMod(param);
		
		if(result > 0) {
			res.getWriter().print(true);
		}else {
			res.getWriter().print(false);
		}
		
		
	}
	
}