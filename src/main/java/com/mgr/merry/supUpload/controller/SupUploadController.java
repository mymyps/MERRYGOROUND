package com.mgr.merry.supUpload.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.couple.model.vo.Attachment;
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
	
	private static List<SupUploadImg> imgList = new ArrayList();
	
	@RequestMapping("/supUp/supReview")
	public ModelAndView supReview(int infoupNum) {
		imgList.clear();
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
	
	
	
	
//	//summernote 이미지파일 저장후 게시판에 쏴주기
//		@RequestMapping(value = "summernote_imageUpload.do", method=RequestMethod.POST)
//		public void uploadSummernoteImage(MultipartFile image, HttpSession session, HttpServletResponse res) throws Exception{
//			String savename = image.getOriginalFilename();
//			
//			System.out.println(image.getOriginalFilename());
//			String path=session.getServletContext().getRealPath("/resources/images/couple");
//			File f=new File(path);
//			if(!f.exists()) f.mkdirs();
//			
//			//파일명 생성(rename)
//			String oriFileName=image.getOriginalFilename();
//			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
//			//규칙설정
//			SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
//			int rdv = (int)(Math.random()*1000);
//			String reName = sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
//			
//			// 파일 실제 저장하기
//	        try {
//	           image.transferTo(new File(path + "/" + reName));
//	     
//	        } catch (Exception e) { //IlligalStateException|IOException
//	        	e.printStackTrace();
//	        }
//	        
//	        
//	        res.getWriter().print("/merry/resources/images/couple/"+reName);
//	        
//	        //DB에 저장 board가 insert된후 boardnum을 가져온후 저장해야함 (따로 필요?)
//	        Attachment att= new Attachment();
//	        System.out.println("setFilerename에 들어갈 값 : "+path+"/"+reName);
////	        att.setFileRename(path+"/"+reName);
//	        att.setFileRename(reName);
//	        
//	        
////	        System.out.println("attachList.size() : "+attachList.size());
//	        
//	        if(attachList.isEmpty()) {
//	        	att.setFlag(1);
//	        	attachList.add(att);
//	        }
//	        else if(attachList.size()>0) {
//	        	att.setFlag(0);
//	        	attachList.add(att);
//	        }
//	        System.out.println("이미지 등록 완료시 :" +attachList);
//		}

	
}
