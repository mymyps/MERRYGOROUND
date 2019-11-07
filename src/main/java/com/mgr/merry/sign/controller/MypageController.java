package com.mgr.merry.sign.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.common.PageBarFactory;
import com.mgr.merry.common.SMTPTemplate;
import com.mgr.merry.sign.model.service.SignService;
import com.mgr.merry.sign.model.vo.Members;
import com.mgr.merry.supporters.model.vo.Supporters;

@Controller

public class MypageController {
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	@Autowired
	SignService service;

	@RequestMapping("/sign/mypage.do")
	public ModelAndView signup(HttpServletRequest request, Members m, Model model ,@RequestParam(value="cPage", required=false,defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
//		String mNo = request.getParameter("mNo");
		int memNo = Integer.parseInt(request.getParameter("mNo"));
//		int memNo = mNo;
		Members result = service.selectMember(m, memNo);
		
		
		int numPerPage=3;
		
		
		Supporters result2 = service.selectSup(memNo);
		if(result2!=null) {
			int supNum = result2.getSupNum();
			int totalCount=service.selectBoardCount(supNum);
			List<Map<String,String>> list = service.selectBoardList(cPage,numPerPage,supNum);
			List<Object> map = service.selectSupt3(supNum);
//			mv.addObject("map", map);
			mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/merry/sign/mypage.do?mNo="+memNo));
			mv.addObject("mNo",memNo);
			mv.addObject("count",totalCount);
			mv.addObject("list",list);
			System.out.println("list : "+ list.toString());
			System.out.println("list.size"+list.size());
		}
		
		
		mv.addObject("members", result);
		mv.addObject("supup", result);
		mv.setViewName("sign/mypage");
		return mv;
	}

	@RequestMapping("/member/update.do")
	public String memberUpdate(HttpServletRequest request, MultipartFile upFile, Members m, Model model) {
//		String mNo=request.getParameter("mNo");
//		System.out.println("!@#@!#@!#@!#"+mNo);
//		System.out.println("!@#!@#@!"+m);
		System.out.println(upFile);
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

	// 비밀번호변경
	@RequestMapping("/member/updatePw.do")
	public String pwUpdate(Members m, Model model) {
		m.setPw(pwEncoder.encode(m.getPw()));
		System.out.println("updatepass" + m);
		int result = service.updatePw(m);

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

	// 커프요청
	@RequestMapping("/member/cupemail.do")
	public String cupemail(HttpServletRequest request, Members m, Model model) {
		System.out.println("########커플요청" + m);
		String authNum = RandomNum();
		String email = m.getEmail();
		System.out.println("####!@#" + email);
		SMTPTemplate.sendmail("인증번호 : " + authNum, email, "현식");
		String email2 = request.getParameter("email2");
		m.setCode(authNum);
		m.setEmail(email2);
		int result = service.updateCode(m);

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

//	@RequestMapping("/signauth2.do")
//	@ResponseBody
//	public String signauth2(HttpServletRequest request) throws Exception {
//		System.out.println("인증메일발송");
//		String authNum = RandomNum();
//		String email = request.getParameter("email");
//		Map<String,String> map = new HashMap();
//		map.put("authNum",authNum);
//		map.put("email", email);
//		int result = service.updateCode(map);
//		
////		System.out.println("커플메일2"+email);
////		String cupemail=request.getParameter("cupemail");
////		System.out.println("####!@#cupemail"+cupemail);
//		
//		SMTPTemplate.sendmail("인증번호 : "+map.get(authNum), map.get(email), "현식");
//		
//		return map.get(authNum);
//	}
	@RequestMapping("/member/cupemailcode.do")
	public String cupemailcode(HttpServletRequest request, Members m, Model model) {
		String email = request.getParameter("email");
//		m.setEmail(email);
		Map<String, Object> map = new HashMap();

		map.put("m", m);
		Members m2 = service.selectCp(m);
		map.put("m2", m2);
		int result = service.updatecupemailcode(map);

		Map<String, String> emailmap = new HashMap();
		emailmap.put("email", m.getEmail());
		emailmap.put("email2", m2.getEmail());
		System.out.println("emailmap" + emailmap);
		result = service.updatecupemailcode2(emailmap);

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

//	@RequestMapping("/member/requestsup.do")
//	public String requestsup(@RequestParam Map<String, String> param, HttpServletRequest request, Model model,
//			@RequestParam(value = "upFile", required = false) MultipartFile[] upFile, SupLvUpload slul) {
//
//		Map<String, Object> data = new HashMap<String, Object>();
//		data.put("memberNum", Integer.parseInt(param.get("memberNum")));
//		data.put("content", param.get("suplvContent"));
//		String url = "";
//		int suplvnum = -1;
//		suplvnum = service.insertSupporter(data);
//		String msg = "";
//		String loc = "";
//		System.out.println("controll@@@"+suplvnum);
//		if (suplvnum != -1) {
//			data.put("suplvnum", suplvnum);
//			for (int i = 0; i < upFile.length; i++) {
//				UUID uuid = UUID.randomUUID();
//				String saveName = uuid + "_" + upFile[i].getOriginalFilename();
//				System.out.println("saveName: {}" + saveName);
//				// 저장할 File 객체를 생성(껍데기 파일)ㄴ
//				String saveFile = request.getSession().getServletContext().getRealPath("/resources/images/member");
//				// 파일 실제 저장하기
//				data.put("file" + i, saveName);
//				try {
//					upFile[i].transferTo(new File(saveFile + "/" + saveName));
//				} catch (Exception e) { // IlligalStateException|IOException
//					e.printStackTrace();
//				}
//			}
//			boolean isCompleted = service.insertSupporterFile(data) == 1 ? true : false;
//			if(isCompleted) {
//				msg="정상등록";
//				int supstatus=0;
//				supstatus = service.updatestatus(data);
//				
//			}else {
//				msg="등록실패";
//			}
//			
//		}
//		model.addAttribute("msg", msg);
//		model.addAttribute("loc", loc);
//		return "sign/msg";
//	}

//	@RequestMapping("/member/requestsup.do")
//	public String requestsup(@RequestParam Map<String,String> param,HttpServletRequest request,Model model,@RequestParam(value="upFile", required=false) MultipartFile[] upFile,SupLvUpload slul) {
//		
//		String memberNum=request.getParameter("memberNum");
//		int num=Integer.parseInt(memberNum);
//		int result = service.updatesuple(num);
//		int slutNum= slul.getMemberNum();
//		SupLvUpload slul11 = service.selectSlul(slutNum);
//		int suplvimgnum= slul11.getSuplvNum();
//				
//		for(String s: param.keySet()){
//			System.out.println("param : "+param.get(s));
//			System.out.println(""+upFile[1].getSize());
//			System.out.println("#####################");
//		}
//		String saveDir=request.getSession().getServletContext().getRealPath("/resources/images/member");
//		List<SupLvUploadImg> supuploadimg=new ArrayList();
//		File dir= new File(saveDir);
//		
//		for(MultipartFile mf : upFile) {
//			if(!mf.isEmpty()) {
//				//파일명 생성(rename)
//				String oriFileName=mf.getOriginalFilename();
//				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
//				//규칙설정
//				SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
//				int rdv = (int)(Math.random()*1000);
//				String reName = sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
//				
//				// 파일 실제 저장하기
//	            try {
//	               mf.transferTo(new File(saveDir + "/" + reName));
//	         
//	            } catch (Exception e) { //IlligalStateException|IOException
//
//	               e.printStackTrace();
//	            }
//	            SupLvUploadImg slui = new SupLvUploadImg();
//	            slui.setFileOrgName1(oriFileName);
//	            supuploadimg.add(slui);
//			}
//		}
//		
//		
//		int result2 = 0;
//		try {
//			result = service.insertsuplvimg(supuploadimg,suplvimgnum);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		String msg = "";
//		String loc = "";
//		if (result > 0 ) {
//			msg = "완료";
//		} else {
//			msg = "실패";
//		}
//		model.addAttribute("msg", msg);
//		model.addAttribute("loc", loc);
//		return "sign/msg";
//	}

	// 이메일
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
}