package com.mgr.merry.infoReview.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.infoReview.model.service.InfoReviewService;
import com.mgr.merry.infoReview.model.vo.InfoReview;

@Controller
public class InfoReviewController {
	
	@Autowired
	InfoReviewService service;
	
	// 수정중
	@RequestMapping("/info/reviewInsert")
	public ModelAndView insertReview (@RequestParam Map<String, String> param, HttpServletRequest request){
		int result = 0;
		result = service.insertReview(param);
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	// 수정중
	@RequestMapping("/info/reviewDelete")
	public String deleteReview(int infoReviewNum) {
		int result = 0;
		result = service.deleteReview(infoReviewNum);
		if(result==0) {
			
		}
		return "/info/infoView";
	}
	
	//수정중
	@RequestMapping("/info/reviewUpdate")
	public String updateReview(int infoReviewNum) {
		int result = 0;
		result = service.updateReview(infoReviewNum);
		if(result==0) {
			
		}
		return "/info/infoView";
	}
}
