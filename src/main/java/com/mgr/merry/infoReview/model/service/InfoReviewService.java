package com.mgr.merry.infoReview.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.infoReview.model.vo.InfoReview;

public interface InfoReviewService {

	int updateReview(int infoReviewNum);

	List<InfoReview> selectReview(int infoupNum);

	int insertReview(Map<String, String> param);

	int status0InfoReview(int infoReviewNum);

}
