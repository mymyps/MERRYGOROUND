package com.mgr.merry.infoReview.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.infoReview.model.vo.InfoReview;

public interface InfoReviewService {

	int deleteReview(int infoReviewNum);

	int updateReview(int infoReviewNum);

	int insertReview(Map<String, String> param);

	List<InfoReview> selectReview(int infoupNum);

}
