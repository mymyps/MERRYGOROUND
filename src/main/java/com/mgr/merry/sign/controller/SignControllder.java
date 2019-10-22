package com.mgr.merry.sign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mgr.merry.sign.model.service.SignService;
import com.mgr.merry.sign.model.vo.Members;

@Controller
public class SignControllder {
	@Autowired
	SignService service;
	
//	@Autowired
//	BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("/member/login.do")
	public String login() {
		return "sign/login";
	}
	
	@RequestMapping("/member/signup.do")
	public String signup() {
		return "sign/signup";
	}
	
//	@RequestMapping("/member/membersignup.do")
//	public String membersignup(Members m,Model model) {
//			System.out.println("!!!!!!!!!!!!!!!!!"+m);
//				m.setPw(pwEncoder.encode(m.getPw()));
//				int result=service.insertMember(m);
//				String msg="";
//				String loc="";
//				if(result>0) {
//					msg="ȸ�����Լ���";
//				}
//				else {
//					msg="ȸ�����Խ���";
//				}
//				model.addAttribute("msg",msg);
//				model.addAttribute("loc",loc);
//				return "sign/msg";
//			
//		
//	}
	
	
}
