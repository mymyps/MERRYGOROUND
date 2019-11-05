package com.mgr.merry.supUpload.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.merry.supUpload.model.dao.SupUploadDao;
import com.mgr.merry.supUpload.model.vo.SupUploadImg;
import com.mgr.merry.supporters.model.vo.Supporters;

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

	@Override
	public int insertSupReview(Map<String, String> param) {
		
		return dao.insertSupUpload(session, param);
	}

	@Override
	public Supporters selectSup(int memberNum) {
		return dao.selectSup(session, memberNum);
	}

}
