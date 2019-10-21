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

	
	@RequestMapping("/info/infoFormEnd.do")
	public ModelAndView insertInfo(@RequestParam Map<String, String> param, @RequestParam(value="infoupFile", required = false)MultipartFile[] infoupFile, HttpServletRequest request){
		
		System.out.println("컨트롤러 param : "+param);
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/info");
		InfoUploadImg infoimg = new InfoUploadImg();
		for(MultipartFile f : infoupFile) {
			if(!f.isEmpty()) {
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch (Exception e) {
					e.printStackTrace();
				}
			infoimg.setFileReName(reName);
			}
		}
		
		int result=0;
		
		try {
			result = service.insertInfo(param, infoimg);
		} catch(Exception e) {
			e.printStackTrace();
		}
		String msg="";
		String loc="/info/infoList.do";
		
		if(result>0) {
			msg="INFO가 등록되었습니다.";
		}else {
			msg="INFO 등록 실패";
		}
		ModelAndView mv = new ModelAndView(); mv.addObject("msg", msg);
		mv.addObject("loc", loc); mv.setViewName("common/msg");
		return mv;
	}
	 
}
