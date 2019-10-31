package com.mgr.merry.supLvUpload.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.merry.supLvUpload.model.dao.SupLvDao;
import com.mgr.merry.supLvUpload.model.vo.SupLvUploadImg;

@Service
public class SupLvServiceImpl implements SupLvService {
	
	@Autowired
	SupLvDao dao;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public int insertSupLv(Map<String, String> param, SupLvUploadImg supLvImg) throws Exception {
		int result=0;
		int result2=0;
		
		result=dao.insertSupLv(session, param);
		
		if(result==0) throw new RuntimeException(); 
		if(result>0) {
			result2=dao.insertSupLvImg(session, supLvImg);
			if(result2==0) throw new Exception();
		}
		
		return result;
	}

}
