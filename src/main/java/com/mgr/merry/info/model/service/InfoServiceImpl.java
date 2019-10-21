package com.mgr.merry.info.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
			infoimg.setInfoupNum(Integer.parseInt(param.get("infoupNum")));
			result2=dao.insertInfoImg(session, infoimg);
			if(result2==0) throw new Exception();
		}
		
		return result;
	}

}
