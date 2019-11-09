package com.mgr.merry.couple.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.couple.model.vo.Attachment;

public interface CoupleBoardService {
	int selectCoupleBoardCount();
	List<Map<String,String>> selectCoupleBoardList(int mNum,int cPage, int numPerPage);
	
	Map<String,String> selectCoupleBoard(int no);
	
	int insertCoupleBoard(Map<String,String> param,List<Attachment> attachList);
	
	int deleteCoupleBoard(int no);
	int deleteAttachment(int no);
	
	List<Attachment> selectAttachList(Map<String,String> param);
	int updateCoupleBoard(Map<String,String> param, List<Attachment> attachList);
	int deleteAttachment2(String src);
	
	int addComment(Map<String,String> param);
	List<Map<String,String>> selectCommentList(int coupleNum);

	int deleteComment(int no);
	int updateComment(Map<String, Object> param);
}