package com.mgr.merry.supUpload.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.merry.supUpload.model.dao.SupUploadDao;
import com.mgr.merry.supUpload.model.vo.SupUploadImg;

@Service
public class SupUploadServiceImpl implements SupUploadService {
	
	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	SupUploadDao dao;

	@Override
	public Map<String, String> selectSupUpload(int infoupNum) {
		return dao.selectSupUpload(session, infoupNum);
	}

	@Override
	public SupUploadImg selectSupUploadImg(int infoupNum) {
		return dao.selectSupUploadImg(session, infoupNum);
	}

}
