package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.info.model.vo.InfoUpload;

public interface SerchDao {
	
//	List<Map<String,Object>> allList(SqlSessionTemplate session);

	List<Map<String,Object>> themaList(SqlSessionTemplate session, int themanum, int themanumref);

	List<Map<String,Object>> themaList(SqlSessionTemplate session, int themanum);
	
	List<Map<String, Object>> localList(SqlSessionTemplate session, int localnum);
}
