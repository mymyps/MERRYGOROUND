package com.mgr.merry.infoReview.model.service;

import java.util.Map;

public interface InfoReviewService {

	int deleteReview(int infoReviewNum);

	int updateReview(int infoReviewNum);

	int insertReview(Map<String, String> param);

}
