package com.mgr.merry.infoReview.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class InfoReviewDaoImpl implements InfoReviewDao {

	@Override
	public int insertReview(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("review.insertReview", param);
	}

	@Override
	public int deleteReview(SqlSessionTemplate session, int infoReviewNum) {
		return session.delete("review.deleteReview", infoReviewNum);
	}

	@Override
	public int updateReview(SqlSessionTemplate session, int infoReviewNum) {
		return session.update("review.updateReview", infoReviewNum);
	}

}
