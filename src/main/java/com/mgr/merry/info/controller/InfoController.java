package com.mgr.merry.info.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.info.model.service.InfoService;
import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.info.model.vo.InfoUploadImg;
import com.mgr.merry.infoReview.model.service.InfoReviewService;
import com.mgr.merry.infoReview.model.vo.InfoReview;
import com.mgr.merry.search.model.service.SearchService;
import com.mgr.merry.search.model.vo.Location;
import com.mgr.merry.search.model.vo.Thema;
import com.mgr.merry.sign.model.service.SignService;
import com.mgr.merry.sign.model.vo.Members;
import com.mgr.merry.supUpload.model.service.SupUploadService;
import com.mgr.merry.supUpload.model.vo.SupUpload;
import com.mgr.merry.supporters.model.vo.Supporters;

@Controller
public class InfoController {

	@Autowired
	InfoService service;

	@Autowired
	SearchService sservice;
	
	@Autowired
	InfoReviewService rservice;
	
	@Autowired
	SupUploadService supservice;
	
	@Autowired
	SignService mservice;
	
	
	// infoForm으로 들어가기
	// 완료
	@RequestMapping("/info/infoForm.do")
	public ModelAndView infoForm(HttpServletRequest request, Members m) {
		
		String mNum=(String)request.getParameter("mNum");
		System.out.println("인포컨트롤러 : "+mNum);
		int memberNum=Integer.parseInt(mNum);
		
		ModelAndView mv = new ModelAndView();
		List<Thema> themaList = sservice.selectThemaList3();
		List<Thema> themaList2 = sservice.selectThemaList4();
		List<Location> locationList = sservice.selectLocationList();
		
		InfoUpload info = new InfoUpload();
//		Members m = new Members();
//		m.setMemberNum(memberNum);
		
		Supporters result2 = supservice.selectSup(memberNum);

		mv.addObject("supporters",result2);
		mv.addObject("themaList", themaList);
		mv.addObject("themaList2", themaList2);
		mv.addObject("locationList", locationList);
		mv.addObject("info", info);
		mv.setViewName("info/infoForm");
		
		
		return mv;
	}

	// infoView로 들어가기
	// supUpload의 여부 확인 추가하기 ( 버튼 서포터즈 리뷰 작성하기 or 서포터즈 리뷰 가기 )
	@RequestMapping("/info/infoView")
	public ModelAndView infoView(int infoupNum, @RequestParam Map<String, String> param) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> info = service.selectInfo(infoupNum);
		InfoUploadImg infoImg = service.selectInfoImg(infoupNum);
		List<InfoReview> review = rservice.selectReview(infoupNum);
		Map<String, String> sup = service.selectSup(param);
		Map<String, String> supUp = supservice.selectSupUpload(infoupNum);
		
		mv.addObject("info", info);
		mv.addObject("infoImg", infoImg);
		mv.addObject("review", review);
		mv.addObject("supUp", supUp);
		mv.setViewName("info/infoView");

		return mv;
	}

	// infoForm 작성 완료
	// 완료
	@RequestMapping("/info/infoFormEnd.do")
	public ModelAndView insertInfo(@RequestParam Map<String, String> param,
			@RequestParam(value = "infoupFile", required = false) MultipartFile[] infoupFile,
			HttpServletRequest request) {

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

		if (result > 0) {
			msg = "INFO가 등록되었습니다.";
		} else {
			msg = "INFO 등록 실패";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
		return mv;
	}

	// info_upload테이블 infoupStatus 0으로 바꾸기
	@RequestMapping("/info/infoStatus0")
	public String infoStatus0(int infoupNum) {
		int result = 0;
		result = service.infoStatus0(infoupNum);
		
		return "/"; // 나중에 경로 바꿀것
	}
	
	@RequestMapping("/info/infoUpdate")
	public ModelAndView updateInfo(int infoupNum, @RequestParam Map<String, String> param,
			@RequestParam(value = "infoupFile", required = false) MultipartFile[] infoupFile,
			HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Thema> themaList = sservice.selectThemaList3();
		List<Thema> themaList2 = sservice.selectThemaList4();
		List<Location> locationList = sservice.selectLocationList();
		
		mv.addObject("themaList", themaList);
		mv.addObject("themaList2", themaList2);
		mv.addObject("locationList", locationList);
		
		Map<String, String> info = service.selectInfo(infoupNum);
		InfoUploadImg infoImg = service.selectInfoImg(infoupNum);
		
		mv.addObject("info", info);
		mv.addObject("infoImg", infoImg);
		
		return mv;
	}
	
	@RequestMapping("/info/infoUpdateEnd")
	public ModelAndView updateInfo(@RequestParam Map<String, String> param,
			@RequestParam(value = "infoupFile", required = false) MultipartFile[] infoupFile,
			HttpServletRequest request, int infoupNum) {

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
			result = service.updateInfo(param, infoimg, infoupNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg = "";

		if (result > 0) {
			msg = "INFO 수정 완료";
		} else {
			msg = "INFO 수정 실패";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
		return mv;
	
	}
}
