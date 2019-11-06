package com.mgr.merry.couple.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.couple.model.vo.Attachment;

public interface CoupleBoardDao {
	int selectCoupleBoardCount(SqlSessionTemplate session);
	List<Map<String,String>> selectCoupleBoardList(SqlSessionTemplate session,int cPage, int numPerPage);
	
	Map<String,String> selectCoupleBoard(SqlSessionTemplate session, int no);
	
	int insertCoupleBoard(SqlSessionTemplate session, Map<String,String> param);
	int insertAttachment(SqlSessionTemplate session, Attachment att);
	
	int deleteCoupleBoard(SqlSessionTemplate session, int no);
	int deleteAttachment(SqlSessionTemplate session, int no);
	
	int updateCoupleBoard(SqlSessionTemplate session, Map<String,String> param);
	int insertAttachment2(SqlSessionTemplate session, Attachment att);
	
	List<Attachment> selectAttachList(SqlSessionTemplate session, Map<String,String> param);
	
	int deleteAttachment2(SqlSessionTemplate session, String src);
	
	
	int addComment(SqlSessionTemplate session, Map<String,String> param);
	List<Map<String,String>> selectCommentList(SqlSessionTemplate session,int coupleNum);
}