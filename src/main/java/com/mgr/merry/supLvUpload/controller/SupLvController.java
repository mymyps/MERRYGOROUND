package com.mgr.merry.supLvUpload.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.info.model.service.InfoService;
import com.mgr.merry.sign.model.service.SignService;
import com.mgr.merry.supLvUpload.model.service.SupLvService;
import com.mgr.merry.supLvUpload.model.vo.SupLvUploadImg;

@Controller
public class SupLvController {

	@Autowired
	SupLvService service;
	
	@Autowired
	InfoService iservice;
	
	@Autowired
	SignService mservice;
	
	@RequestMapping("/supLv/supLvForm.do")
	public ModelAndView supLvUpload(String id, @RequestParam Map<String, String> param) {
		
		
		ModelAndView mv = new ModelAndView();
		String msg="";
		
		Map<String, String> sup = iservice.selectSup(param);
		Map<String, String> mem = mservice.selectMemberId(id);
		System.out.println("서포터즈가 아닐시 sup :"+sup);
		
		if(id=="") {
			msg="로그인  후 이용가능합니다.";
			mv.addObject("msg", msg);
			mv.setViewName("/common/msg");
			
		}else if (sup!=null) {
			msg="이미 등록된 서포터즈입니다.";
			mv.addObject("msg", msg);
			mv.setViewName("/common/msg");
		}
		
		else {
			mv.setViewName("/supLv/supLvForm");
		}
		
		return mv;
	}
	
	
	@RequestMapping("/supLv/supLvFormEnd.do")
	public ModelAndView supLvFormEnd(@RequestParam Map<String, String> param,
			@RequestParam(value = "supLvImg1", required = false) MultipartFile[] supLvUploadImg1,
			@RequestParam(value = "supLvImg2", required = false) MultipartFile[] supLvUploadImg2,
			@RequestParam(value = "supLvImg3", required = false) MultipartFile[] supLvUploadImg3,
			@RequestParam(value = "supLvImg4", required = false) MultipartFile[] supLvUploadImg4,
			@RequestParam(value = "supLvImg5", required = false) MultipartFile[] supLvUploadImg5,
			HttpServletRequest request, String id) {

		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/supLv");
		SupLvUploadImg supLvImg= new SupLvUploadImg();
		
		for (MultipartFile f1 : supLvUploadImg1){
			if(!f1.isEmpty()) {
				String oriFileName=f1.getOriginalFilename();
				try {
					f1.transferTo(new File(saveDir+"/"+oriFileName));
				} catch(Exception e) {
					e.printStackTrace();
				}
				supLvImg.setFileOrgName1(oriFileName);
			}
		}
		for (MultipartFile f2 : supLvUploadImg2){
			if(!f2.isEmpty()) {
				String oriFileName=f2.getOriginalFilename();
				try {
					f2.transferTo(new File(saveDir+"/"+oriFileName));
				} catch(Exception e) {
					e.printStackTrace();
				}
				supLvImg.setFileOrgName2(oriFileName);
			}
		}
		for (MultipartFile f3 : supLvUploadImg3){
			if(!f3.isEmpty()) {
				String oriFileName=f3.getOriginalFilename();
				try {
					f3.transferTo(new File(saveDir+"/"+oriFileName));
				} catch(Exception e) {
					e.printStackTrace();
				}
				supLvImg.setFileOrgName3(oriFileName);
			}
		}
		for (MultipartFile f4 : supLvUploadImg4){
			if(!f4.isEmpty()) {
				String oriFileName=f4.getOriginalFilename();
				try {
					f4.transferTo(new File(saveDir+"/"+oriFileName));
				} catch(Exception e) {
					e.printStackTrace();
				}
				supLvImg.setFileOrgName4(oriFileName);
			}
		}
		for (MultipartFile f5 : supLvUploadImg5){
			if(!f5.isEmpty()) {
				String oriFileName=f5.getOriginalFilename();
				try {
					f5.transferTo(new File(saveDir+"/"+oriFileName));
				} catch(Exception e) {
					e.printStackTrace();
				}
				supLvImg.setFileOrgName5(oriFileName);
			}
		}
		
		int result = 0;
		int result2 = 0;
		
		try {
			result = service.insertSupLv(param, supLvImg);
			result2 = service.updateSupStatus(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg = "";

		if (result > 0) {
			msg = "서포터즈 신청이 등록되었습니다.";
		} else {
			msg = "서포터즈 신청시에는 5개 이미지를 모두 등록해야 합니다.";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
		return mv;
	}
}
