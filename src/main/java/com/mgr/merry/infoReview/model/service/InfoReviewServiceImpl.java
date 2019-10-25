package com.mgr.merry.infoReview.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.merry.infoReview.model.dao.InfoReviewDao;

@Service
public class InfoReviewServiceImpl implements InfoReviewService {

	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	InfoReviewDao dao;
	
	// 수정중
	@Override
	public int deleteReview(int infoReviewNum) {
		return dao.deleteReview(session, infoReviewNum);
	}

	// 수정중
	@Override
	public int updateReview(int infoReviewNum) {
		return dao.updateReview(session, infoReviewNum);
	}

	// 수정중
	@Override
	public int insertReview(Map<String, String> param) {
		int result = 0;
		result=dao.insertReview(session, param);
		if(result==0) throw new RuntimeException();
		
		return result;
	}

}
