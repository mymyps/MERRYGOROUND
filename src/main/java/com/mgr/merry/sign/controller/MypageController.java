package com.mgr.merry.sign.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mgr.merry.sign.model.service.SignService;
import com.mgr.merry.sign.model.vo.Members;
@Controller
public class MypageController {
	@Autowired
	SignService service;
	@RequestMapping("/sign/mypage.do")
	public String signup(HttpServletRequest request,Members m,Model model) {
		String mNo=request.getParameter("mNo");
		System.out.println("!!!!!!!mNo"+mNo);
		int memNo=Integer.parseInt(mNo);
		System.out.println("!!!!!!!memNo"+memNo);
		Members result = service.selectMember(m,memNo);
//		List<Members> members=service.selectMember(memNo);
		model.addAttribute("members",result);
		
		return "sign/mypage";
	}
	
	@RequestMapping("/member/update.do")
	public String memberUpdate(HttpServletRequest request,Members m,Model model) {
//		String mNo=request.getParameter("mNo");
//		System.out.println("!@#@!#@!#@!#"+mNo);
		System.out.println("!@#!@#@!"+m);
		int result = service.updateMember(m);
		
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "완료";
		} else {
			msg = "실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "sign/msg";
	}

}
