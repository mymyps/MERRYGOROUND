package com.mgr.merry.infoReview.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.infoReview.model.vo.InfoReview;

public interface InfoReviewDao {

	int insertReview(SqlSessionTemplate session, Map<String, String> param);

	int deleteReview(SqlSessionTemplate session, int infoReviewNum);

	int updateReview(SqlSessionTemplate session, int infoReviewNum);

	List<InfoReview> selectReview(SqlSessionTemplate session, int infoupNum);

}
