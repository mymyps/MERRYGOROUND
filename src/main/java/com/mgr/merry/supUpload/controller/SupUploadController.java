package com.mgr.merry.supUpload.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.info.model.service.InfoService;
import com.mgr.merry.search.model.service.SearchService;
import com.mgr.merry.supLvUpload.model.service.SupLvService;
import com.mgr.merry.supUpload.model.service.SupUploadService;
import com.mgr.merry.supUpload.model.vo.SupUploadImg;

@Controller
public class SupUploadController {

	@Autowired
	SupUploadService service;
	
	@Autowired
	InfoService iservice;
	
	@Autowired
	SearchService sservice;
	
	@Autowired
	SupLvService lvservice;
	
	@RequestMapping("/supUp/supReview")
	public ModelAndView supReview(int infoupNum) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, String> supUpload= service.selectSupUpload(infoupNum);
		SupUploadImg supUploadImg = service.selectSupUploadImg(infoupNum);
		
		mv.addObject("supUpload", supUpload);
		mv.addObject("supUploadImg", supUploadImg);
		
		return mv;
	}
	
	@RequestMapping("/supUp/supReviewForm.do")
	public ModelAndView supReviewForm(int infoupNum) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> info = iservice.selectInfo(infoupNum);
		
		
		mv.addObject("info", info);
		mv.setViewName("supUp/supReviewForm");
		
		return mv;
	}
	
	@RequestMapping("/supUp/supReviewFormEnd")
	public ModelAndView supReviewFormEnd(@RequestParam Map<String, String> param, int memberNum) {
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		int result2 = 0;

		result = service.insertSupReview(param);
//		result2 = service.selectSup(memberNum);
		
		
		String msg = "";

		if (result > 0) {
			msg = "서포터즈 리뷰가 등록되었습니다.";
		} else {
			msg = "서포터즈 리뷰 등록 실패";
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
		return mv;
	}
	
}
