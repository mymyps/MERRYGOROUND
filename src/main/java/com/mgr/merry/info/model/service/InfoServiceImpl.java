package com.mgr.merry.info.model.service;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.info.model.dao.InfoDao;
import com.mgr.merry.info.model.vo.InfoUploadImg;

@Service
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	InfoDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	// 수정중
	@Override
	public int insertInfo(Map<String, String> param, InfoUploadImg infoimg) throws Exception {
		int result=0;
		int result2=0;
		
		result=dao.insertInfo(session, param); // info_upload테이블 insert
		
		if(result==0) throw new RuntimeException(); 
		if(result>0) {
			result2=dao.insertInfoImg(session, infoimg); // info_upload_img 
			if(result2==0) throw new Exception();
		}
		
		return result;
	}

	// 수정중
	@Override
	public Map<String, String> selectInfo(int infoupNum) {
		return dao.selectInfo(session, infoupNum);
	}

	// 수정중
	@Override
	public InfoUploadImg selectInfoImg(int infoupNum) {
		return dao.selectInfoImg(session, infoupNum);
	}

	// 수정중
//	@Override
//	public int deleteInfo(int infoupNum) {
//		int result=0;
//		result=dao.deleteInfo(session, infoupNum);
//		if(result==0) throw new RuntimeException();
//		
//		return result;
//	}
//
//	@Override
//	public int deleteInfoImg(int infoupNum) {
//		int result=0;
//		result=dao.deleteInfoImg(session, infoupNum);
//		if(result==0) throw new RuntimeException();
//		return 0;
//	}
	
	@Override
	public int infoStatus0(int infoupNum) {
		return dao.updateInfoStatus0(session, infoupNum);
	}

	@Override
	public int updateInfo(Map<String, String> param, InfoUploadImg infoimg, int infoupNum) throws Exception {
		int result=0; // info update
		int result2=0; // img 삭제
		int result3=0; // img insert
		
		result=dao.updateInfo(session, param);
		System.out.println("서비스 업데이트 : "+result);
		
		if(result==0) throw new RuntimeException(); 
		if(result>0) {
			result2 = dao.deleteInfoImg(session, infoupNum);
			result3 = dao.insertInfoImg2(session, infoimg);
			if(result3==0) throw new Exception();
		}
		
		
		return result;
	}

	@Override
	public Map<String, String> selectSup(Map<String, String> param) {
		return dao.selectSup(session, param);
	}



}
