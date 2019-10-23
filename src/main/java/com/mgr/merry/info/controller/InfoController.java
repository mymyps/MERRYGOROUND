package com.mgr.merry.info.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.info.model.service.InfoService;
import com.mgr.merry.info.model.vo.InfoUploadImg;

@Controller
public class InfoController {

	@Autowired
	InfoService service;

	@RequestMapping("/info/infoForm")
	public String infoForm() {
		return "info/infoForm";
	}

//	infoList에서 infoupNum을 받아야함
	@RequestMapping("/info/infoView.do")
	public ModelAndView infoView(int infoupNum) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> info = service.selectInfo(infoupNum);
		InfoUploadImg infoImg = service.selectInfoImg(infoupNum);

		mv.addObject("info", info); mv.addObject("infoImg", infoImg);
		mv.setViewName("info/infoView");

		return mv;
	}

//	
	@RequestMapping("/info/infoFormEnd.do")
	public ModelAndView insertInfo(@RequestParam Map<String, String> param,
			@RequestParam(value = "infoupFile", required = false) MultipartFile[] infoupFile,
			HttpServletRequest request) {

		System.out.println("컨트롤러 param : " + param);
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/info");
		InfoUploadImg infoimg = new InfoUploadImg();
		for (MultipartFile f : infoupFile) {
			if (!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMssSSS");
				int rdv = (int) (Math.random() * 1000);
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
				try {
					f.transferTo(new File(saveDir + "/" + reName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				infoimg.setFileReName(reName);
			}
		}

		int result = 0;

		try {
			result = service.insertInfo(param, infoimg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg = "";
//		String loc = "/info/infoList.do";

		if (result > 0) {
			msg = "INFO가 등록되었습니다.";
		} else {
			msg = "INFO 등록 실패";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
//		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}

	
	@RequestMapping("/info/infoDelete")
	public String infoDelete(int infoupNum) {
		int result = 0;
		int result2 = 0;
		result = service.deleteInfo(infoupNum);
		result2 = service.deleteInfoImg(infoupNum);
		
		if(result==0) {
			
		}
		
		return "/info/infoList";
	}
	
	// 수정중
	@RequestMapping("/info/infoUpdate")
	public ModelAndView updateInfo(@RequestParam Map<String, String> param,
			@RequestParam(value = "infoupFile", required = false) MultipartFile[] infoupFile,
			HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	
}
