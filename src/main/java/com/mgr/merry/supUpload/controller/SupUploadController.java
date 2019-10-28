package com.mgr.merry.supUpload.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.supUpload.model.service.SupUploadService;
import com.mgr.merry.supUpload.model.vo.SupUploadImg;

@Controller
public class SupUploadController {

	@Autowired
	SupUploadService service;
	
	@RequestMapping("/supUp/supReview")
	public ModelAndView supReview(int infoupNum) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, String> supUpload= service.selectSupUpload(infoupNum);
		SupUploadImg supUploadImg = service.selectSupUploadImg(infoupNum);
		
		System.out.println("서포터즈업로드컨트롤러 업로드 : "+supUpload);
		
		mv.addObject("supUpload", supUpload);
		mv.addObject("supUploadImg", supUploadImg);
		
		return mv;
	}
	
}
