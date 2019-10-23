package com.mgr.merry.search.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.info.model.vo.InfoUpload;

@Repository
public class SearchDaoImpl implements SerchDao {

//	@Override
//	public List<Map<String, Object>> allList(SqlSessionTemplate session) {
//	
//		return session.selectList("search.allList");
//	}

    //메인테마 조회 
	@Override
	public List<Map<String,Object>> themaList(SqlSessionTemplate session,int themanum, int themanumref) {
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("themanum", themanum);
		param.put("themanumref", themanumref);
		
		return session.selectList("search.themaList1",param);
	}

	// 서브테마 조회
	@Override
	public List<Map<String,Object>> themaList(SqlSessionTemplate session,int themanum) {
		
		return session.selectList("search.themaList2",themanum);
	}

	@Override
	public List<Map<String, Object>> localList(SqlSessionTemplate session, int localNum) {
	
		return session.selectList("search.localList",localNum);
	}



}
