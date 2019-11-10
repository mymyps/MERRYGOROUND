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
import com.mgr.merry.info.model.vo.InfoUploadImg;
import com.mgr.merry.infoReview.model.vo.InfoReview;
import com.mgr.merry.search.model.service.SearchService;
import com.mgr.merry.supLvUpload.model.service.SupLvService;
import com.mgr.merry.supUpload.model.service.SupUploadService;
import com.mgr.merry.supUpload.model.vo.SupUploadImg;
import com.mgr.merry.supporters.model.vo.Supporters;

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
	
	private static List<SupUploadImg> imgList = new ArrayList<SupUploadImg>();
	
	@RequestMapping("/supUp/supReview")
	public ModelAndView supReview(int infoupNum, @RequestParam Map<String, String> param) {
		imgList.clear();
		ModelAndView mv = new ModelAndView();
		
		System.out.println("param :"+param);
		
		Map<String, String> supUpload= service.selectSupUpload2(infoupNum);
		Map<String, String> sup = iservice.selectSup(param);
//		SupUploadImg supUploadImg = service.selectSupUploadImg(infoupNum);
		
		mv.addObject("supUpload", supUpload);
		mv.addObject("sup", sup);
//		mv.addObject("supUploadImg", supUploadImg);
		
		return mv;
	}
	
	@RequestMapping("/supUp/supReviewForm.do")
	public ModelAndView supReviewForm(int infoupNum, @RequestParam Map<String, String> param) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> info = iservice.selectInfo(infoupNum);
		Map<String, String> sup = iservice.selectSup(param);
		
		System.out.println("컨트롤러 sup : "+sup);
		
		mv.addObject("info", info);
		mv.addObject("sup", sup);
		mv.setViewName("supUp/supReviewForm");
		
		return mv;
	}
	
	@RequestMapping("/supUp/supReviewFormEnd.do")
	public ModelAndView supReviewFormEnd(@RequestParam Map<String, String> param, int infoupNum, String id) {
		ModelAndView mv = new ModelAndView();

		System.out.println("섶리 파라미터값 : "+param);
		
		int result = 0;
		int imgResult = 0;
		
		result = service.insertSupReview(param);
		
		if(imgList.size()>0) {
			try {
				System.out.println("writeEnd안에서 param: "+param);
				imgResult = service.insertSupUploadImgNum(param,imgList);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		String msg = "";
		String loc ="";
		
		if (result > 0) {
			msg = "서포터즈 리뷰가 등록되었습니다.";
			loc = "/supUp/supReview?infoupNum="+infoupNum+"&id="+id;
		} else {
			msg = "서포터즈 리뷰 등록 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//summernote 이미지파일 저장후 게시판에 쏴주기
		@RequestMapping(value = "summernote_imageUpload_supRv2.do", method=RequestMethod.POST)
		public void uploadSummernoteImage2(MultipartFile image, HttpSession session, HttpServletResponse res) throws Exception{
			String savename = image.getOriginalFilename();
			
			System.out.println(image.getOriginalFilename());
			String path=session.getServletContext().getRealPath("/resources/images/supRv");
			File f=new File(path);
			if(!f.exists()) f.mkdirs();
			
			//파일명 생성(rename)
			String oriFileName=image.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			//규칙설정
			SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
			int rdv = (int)(Math.random()*1000);
			String reName = sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
			
			// 파일 실제 저장하기
	        try {
	           image.transferTo(new File(path + "/" + reName));
	     
	        } catch (Exception e) { //IlligalStateException|IOException
	        	e.printStackTrace();
	        }
	        
	        
	        res.getWriter().print("/19AM_MERRYGOROUND_final/resources/images/supRv/"+reName);
	        
	        //DB에 저장 board가 insert된후 boardnum을 가져온후 저장해야함 (따로 필요?)
	        SupUploadImg supupImg= new SupUploadImg();
	        System.out.println("setFilerename에 들어갈 값 : "+path+"/"+reName);
//	        att.setFileRename(path+"/"+reName);
	        
	        supupImg.setFileReName(reName);
	        
	        
//	        System.out.println("attachList.size() : "+attachList.size());
	        
	        	imgList.add(supupImg);
	        System.out.println("이미지 등록 완료시 :" +imgList);
		}
	
	
	
	
	//summernote 이미지파일 저장후 게시판에 쏴주기
	@RequestMapping(value = "summernote_imageUpload_supRv.do", method=RequestMethod.POST)
	public void uploadSummernoteImage(MultipartFile image, HttpSession session, HttpServletResponse res, int supupNum) throws Exception{
		String savename = image.getOriginalFilename();
		
		System.out.println(image.getOriginalFilename());
		String path=session.getServletContext().getRealPath("/resources/images/supRv");
		File f=new File(path);
		if(!f.exists()) f.mkdirs();
		
		//파일명 생성(rename)
		String oriFileName=image.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		//규칙설정
		SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
		int rdv = (int)(Math.random()*1000);
		String reName = sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
		
		// 파일 실제 저장하기
        try {
           image.transferTo(new File(path + "/" + reName));
     
        } catch (Exception e) { //IlligalStateException|IOException
        	e.printStackTrace();
        }
        
        
        res.getWriter().print("/19AM_MERRYGOROUND_final/resources/images/supRv/"+reName);
        
        //DB에 저장 board가 insert된후 boardnum을 가져온후 저장해야함 (따로 필요?)
        SupUploadImg supupImg= new SupUploadImg();
        System.out.println("setFilerename에 들어갈 값 : "+path+"/"+reName);
//        att.setFileRename(path+"/"+reName);
        
//        supupNum을 받아와야..하는뎅뎅
        supupImg.setSupupNum(supupNum);
        supupImg.setFileReName(reName);
        
        
//        System.out.println("attachList.size() : "+attachList.size());
        
        	imgList.add(supupImg);
        System.out.println("이미지 등록 완료시 :" +imgList);
	}
	
	@RequestMapping("supUp/supReviewUpdate.do")
	public ModelAndView supReviewUpdate(int infoupNum, @RequestParam Map<String, String> param) {
		imgList.clear();
		ModelAndView mv = new ModelAndView();
		
		System.out.println("param :"+param);
		
		Map<String, String> supUpload= service.selectSupUpload2(infoupNum);
		
		Map<String, String> sup = iservice.selectSup(param);
		Map<String, String> info = iservice.selectInfo(infoupNum);
		InfoUploadImg infoImg = iservice.selectInfoImg(infoupNum);
//		SupUploadImg supUploadImg = service.selectSupUploadImg(infoupNum);
		
		mv.addObject("supUpload", supUpload);
		mv.addObject("sup", sup);
//		mv.addObject("supUploadImg", supUploadImg);
		mv.addObject("info", info);
		mv.addObject("infoImg", infoImg);
		mv.setViewName("/supUp/supReviewUpdate");
		
		return mv;
	}
	
	@RequestMapping("supUp/supReviewUpadeEnd.do")
	public ModelAndView supReviewUpadeEnd(@RequestParam Map<String, String> param, int infoupNum, String id) {
		ModelAndView mv = new ModelAndView();

		int result = 0;
		int imgResult = 0;
		
		result = service.updateSupReview(param);
		
		if(imgList.size()>0) {
			try {
				imgResult = service.insertSupUploadImg(param,imgList);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "서포터즈 리뷰가 수정됐습니다.";
			loc = "/supUp/supReview?infoupNum="+infoupNum+"&id="+id;
		} else {
			msg = "서포터즈 리뷰 수정 실패";
			loc = "/supUp/supReviewUpdate.do?infoupNum="+infoupNum+"&id="+id;
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/supUp/supReviewStatus0")
	public ModelAndView infoStatus0(int infoupNum, String id) {
		int result = 0;
		result = service.supRvStatus0(infoupNum);
		String msg = "";
		String loc = "";
		
		ModelAndView mv = new ModelAndView();
		if(result>0) {
			msg="리뷰가 삭제됐습니다.";
			loc="/info/infoView.do?infoupNum="+infoupNum+"&id="+id;
		} else {
			msg="리뷰 삭제가 실패했습니다.";
			loc="/supUp/supReview?infoupNum="+infoupNum+"&id="+id;
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
}
