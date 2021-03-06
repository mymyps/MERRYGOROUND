package com.mgr.merry.sign.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.common.SMTPTemplate;
import com.mgr.merry.sign.model.service.SignService;
import com.mgr.merry.sign.model.vo.Members;
@SessionAttributes(value= {"loginMember"}) 
//session
@Controller
public class SignControllder {
	@Autowired
	SignService service;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@RequestMapping("/member/login.do")
	public String login() {
		return "sign/login";
	}

	@RequestMapping("/member/signup.do")
	public String signup() {
		return "sign/signup";
	}
	//아이디 중복 확인
	@RequestMapping("/sign/checkId.do")
	public void calSave(Members m, HttpServletResponse res) throws IOException {
		//비지니스 로직
		System.out.println("checkid"+m);
		Members result = service.checkId(m);
		System.out.println("성공여부 : " + result);
		if(result==null) {
			res.getWriter().print(true);
		}else {
			res.getWriter().print(false);
		}
	}
	// 회원가입
	@RequestMapping("/member/membersignup.do")
	public String membersignup(Members m, Model model, MultipartFile upFile, HttpServletRequest request) {
//		System.out.println("!!!!!!!!!!!!!!!!!" + m);
		System.out.println("파일 이름: {}" + upFile.getOriginalFilename());
		System.out.println("파일 크기: {}" + upFile.getSize());

		// 파일 이름 변경
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + upFile.getOriginalFilename();
		System.out.println("saveName: {}" + saveName);

		// 저장할 File 객체를 생성(껍데기 파일)ㄴ
		String saveFile = request.getSession().getServletContext().getRealPath("/resources/images/member");
		// 파일 실제 저장하기

		try {
			upFile.transferTo(new File(saveFile + "/" + saveName));
			m.setProimg(saveName);
			System.out.println("m     :  " + m);

		} catch (Exception e) { // IlligalStateException|IOException

			e.printStackTrace();
		}

		m.setPw(pwEncoder.encode(m.getPw()));
		int result = service.insertMember(m);
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

	// 비밀번호찾기
	@RequestMapping("/member/searchpw.do")
	public String searchpw(Members m, Model model) {
		return "sign/searchpw";
	}
	@RequestMapping("/member/searchid.do")
	public String searchid(Members m,Model model) {
		return "sign/searchid";
	}
	@RequestMapping("/member/searchidend.do")
	public String searchidend(Members m,Model model) {
		System.out.println("아이디찾기"+m);
		String msg="";
		String loc="";
		List<Members> list = service.searchid(m);
		System.out.println("list123"+list);
	
		if(list!=null) {
			msg="아이디는  "+list.get(0).getId()+"입니다";
		}else {
			msg="실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "sign/msg";
	}
	@RequestMapping("/member/searchpwend.do")
	public ModelAndView searchpwend(Members m) {
		System.out.println("비밀번호찾기" + m);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sign/searchpwend");
		mv.addObject("email", m.getEmail());
		mv.addObject("id", m.getId());
		return mv;
	}

	@RequestMapping("/sign/updatepw")
	public String pwUpdate(Members m, Model model) {
		m.setPw(pwEncoder.encode(m.getPw()));
		System.out.println("updatepass" + m);
		int result = service.pwUpdate(m);

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

	@RequestMapping("/emailAuth.do")
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String email = request.getParameter("email");
		String authNum = RandomNum();

		sendEmail(email, authNum);

		SMTPTemplate.sendmail("인증번호 : " + authNum, email, "현식");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("sign/mail");
		mv.addObject("email", email);
		mv.addObject("authNum", authNum);

		return mv;
	}

	@RequestMapping("/signauth.do")
	@ResponseBody
	public String signauth(HttpServletRequest request) throws Exception {
		System.out.println("인증메일발송");
		String authNum = RandomNum();
		String email = request.getParameter("email");

//		String cupemail=request.getParameter("cupemail");
//		System.out.println("####!@#cupemail"+cupemail);

//		 sendEmail(email,authNum);
		SMTPTemplate.sendmail("인증번호 : " + authNum, email, "현식");

		return authNum;
	}

	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com"; // smtp서버
		String subject = "인증번호";
		String fromName = "관리자";
		String from = "mgrmgr1004@gmail.com";
		String to1 = email;
		String content = "인증번호[" + authNum + "]";

		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("  ", "  ");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	//로그인
	@RequestMapping("/sign/memberLogin.do")
	public String memberLogin(Members m, Model model,SessionStatus session, HttpServletRequest request,SessionStatus status) {
//		m.setPw(pwEncoder.encode(m.getPw()));

//		HttpSession session = request.getSession();
		
		Members result = service.selectMemberOne(m);
		String msg = "";
		String loc = "/";
		
		if (result==null) {
			msg = "아이디없음";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

			return "sign/msg";
		} 
		
		if(result.getStatus()==0) {
			msg="탈퇴한 회원 입니다";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);

			return "sign/msg";
		}
		
		else if (pwEncoder.matches(m.getPw(), result.getPw())) {
			msg = "로그인 성공";
			model.addAttribute("loginMember", result);
//			session.setAttribute("loginMember", result);
			
		} else {
			msg = "비밀번호가 틀립니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "sign/msg";
	}

	// 로그아웃
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session, SessionStatus status) {
//		session.invalidate();
		if (!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/";
	}

}
