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
	
	@Override
	public int insertInfo(Map<String, String> param, InfoUploadImg infoimg) throws Exception {
		int result=0;
		int result2=0;
		result=dao.insertInfo(session, param);
		if(result==0) throw new RuntimeException();
		if(result>0) {
			// 임의로 infoupNum 지정하겠음!
			// 나중에 infoView 완성했을 때 modelAndView ~ 매개변수로 int infoupNum받아오기
//			infoimg.setInfoupNum(Integer.parseInt(param.get("infoupNum")));
			infoimg.setInfoupNum(1);
			result2=dao.insertInfoImg(session, infoimg);
			if(result2==0) throw new Exception();
		}
		
		return result;
	}

	@Override
	public Map<String, String> selectInfo(int infoupNum) {
		return dao.selectInfo(session, infoupNum);
	}

	@Override
	public InfoUploadImg selectInfoImg(int infoupNum) {
		return dao.selectInfoImg(session, infoupNum);
	}

	@Override
	public int deleteInfo(int infoupNum) {
		int result=0;
		result=dao.deleteInfo(session, infoupNum);
		if(result==0) throw new RuntimeException();
		
		return result;
	}

	@Override
	public int deleteInfoImg(int infoupNum) {
		int result=0;
		result=dao.deleteInfoImg(session, infoupNum);
		if(result==0) throw new RuntimeException();
		return 0;
	}


}
