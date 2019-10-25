package com.mgr.merry.couple.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface CoupleBoardDao {
	int selectCoupleBoardCount(SqlSessionTemplate session);
	List<Map<String,String>> selectCoupleBoardList(SqlSessionTemplate session,int cPage, int numPerPage);
	
	Map<String,String> selectCoupleBoard(SqlSessionTemplate session, int no);
	
	int insertCoupleBoard(SqlSessionTemplate session, Map<String,String> param);
}
