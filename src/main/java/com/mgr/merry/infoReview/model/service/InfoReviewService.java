package com.mgr.merry.infoReview.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.infoReview.model.vo.InfoReview;

public interface InfoReviewService {

	int updateReview(Map<String, String> param);

	List<InfoReview> selectReview(int infoupNum);

	int insertReview(Map<String, String> param) throws Exception;

	int status0InfoReview(int infoReviewNum);

}
