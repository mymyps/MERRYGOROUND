package com.mgr.merry.infoReview.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mgr.merry.infoReview.model.dao.InfoReviewDao;
import com.mgr.merry.infoReview.model.vo.InfoReview;

@Service
public class InfoReviewServiceImpl implements InfoReviewService {

	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	InfoReviewDao dao;

	// 수정중
	@Override
	public int updateReview(Map<String, String> param) {
		return dao.updateReview(session, param);
	}


	@Override
	public List<InfoReview> selectReview(int infoupNum) {
		return dao.selectReview(session, infoupNum);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertReview(Map<String, String> param) {
		int result = 0;
		result = dao.insertReview(session, param);
		if(result==0) throw new RuntimeException();
		return result;
	}


	@Override
	public int status0InfoReview(int infoReviewNum) {
		return dao.status0InfoReview(session, infoReviewNum);
	}

}
