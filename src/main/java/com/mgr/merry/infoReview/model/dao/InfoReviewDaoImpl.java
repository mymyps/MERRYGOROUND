package com.mgr.merry.infoReview.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.infoReview.model.vo.InfoReview;

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
	public int updateReview(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("review.updateReview", param);
	}

	@Override
	public List<InfoReview> selectReview(SqlSessionTemplate session, int infoupNum) {
		// TODO Auto-generated method stub
		return session.selectList("review.selectReview", infoupNum);
	}

	@Override
	public int status0InfoReview(SqlSessionTemplate session, int infoReviewNum) {
		return session.update("review.status0InfoReview", infoReviewNum);
	}

}
