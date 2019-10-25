package com.mgr.merry.sign.controller;

import java.util.Properties;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.common.SMTPTemplate;
import com.mgr.merry.sign.model.service.SignService;
import com.mgr.merry.sign.model.vo.Members;

@SessionAttributes(value= {"loginMember"})
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
	//회원가입
	@RequestMapping("/member/membersignup.do")
	public String membersignup(Members m, Model model) {
//		System.out.println("!!!!!!!!!!!!!!!!!" + m);
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

//	 @RequestMapping("/email.do") 
//	 public String email() { 
//		 return "sign/mail"; 
//		 }
	
	@RequestMapping("/emailAuth.do")
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String email = request.getParameter("email");
		String authNum = RandomNum();

		// sendEmail(email,authNum);

		SMTPTemplate.sendmail("인증번호 : "+authNum, email, "현식이형바보");

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

		// sendEmail(email,authNum);
		SMTPTemplate.sendmail("인증번호 : "+authNum, email, "현식이형바보");
		
		return authNum;
	}

	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com"; // smtp서버
		String subject = "인증번호";
		String fromName = "관리자";
		String from = "11agumon@gamil.com";
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
	@RequestMapping("/sign/memberLogin.do")
	public String memberLogin(Members m, Model model,SessionStatus session) {
		
//		logger.debug(m.getId());
//		logger.debug(m.getPw());
		
		Members result = service.selectMemberOne(m);
//		logger.debug(result.toString());
		String msg="";
		String loc="/";
//		if(m2.getPassword().equals(m.getPassword())) {
//		logger.debug(pwEncoder.encode(m.getPassword()));
//		logger.debug(result.getPassword());
		if(pwEncoder.matches(m.getPw(), result.getPw())) {
			msg="로그인 성공";
			model.addAttribute("loginMember", result);
			System.out.println(session.toString());
		}
		else if(m.getId()!=result.getId()) {
			msg="아이디가 없습니다.";
		}
		else{
			msg="비밀번호가 틀립니다.";
			
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "sign/msg";
	}
	//로그아웃
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session,SessionStatus status) {
//		session.invalidate();
		if(!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/";
	}
	
}
