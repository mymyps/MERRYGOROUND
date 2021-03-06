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
import com.mgr.merry.sign.model.service.SignService;
import com.mgr.merry.sign.model.vo.Members;

@Controller
public class InfoReviewController {
   
   @Autowired
   InfoReviewService service;
   
   // 수정중
   @RequestMapping("/infoReview/insertInfoReview")
   public ModelAndView insertReview (@RequestParam Map<String, String> param, HttpServletRequest request, int infoupNum, String id){
      
      int result = 0;
      try {
		result = service.insertReview(param);
	} catch (Exception e) {
		e.printStackTrace();
	}
      
      String msg = "";
      String loc = "";
		if (result > 0) {
			msg = "리뷰가 등록되었습니다.";
			loc = "/info/infoView.do?infoupNum="+infoupNum+"&id="+id;
		} else {
			msg = "리뷰 등록 실패";
			loc = "/info/infoView.do?infoupNum="+infoupNum+"&id="+id;
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	// 수정중
	@RequestMapping("/info/status0InfoReview")
	public ModelAndView status0InfoReview(int infoReviewNum, int infoupNum, String id) {
		int result = 0;
		result = service.status0InfoReview(infoReviewNum);
		
		String msg="";
		String loc="";
		if (result > 0) {
			msg = "리뷰가 삭제됐습니다.";
			loc = "/info/infoView.do?infoupNum="+infoupNum+"&id="+id;
		} else {
			msg = "리뷰 삭제 실패";
			loc = "/info/infoView.do?infoupNum="+infoupNum+"&id="+id;
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	//수정중
	@RequestMapping("/info/updateInfoReview")
	public ModelAndView updateReview(@RequestParam Map<String, String> param, int infoupNum, String id) {
		
		int result = 0;
		
		result = service.updateReview(param);

		ModelAndView mv = new ModelAndView();
		
		String msg="";
		String loc="";
		if (result > 0) {
			msg = "리뷰가 수정됐습니다.";
			loc = "/info/infoView.do?infoupNum="+infoupNum+"&id="+id;
		} else {
			msg = "리뷰 수정 실패";
			loc = "/info/infoView.do?infoupNum="+infoupNum+"&id="+id;
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
}
