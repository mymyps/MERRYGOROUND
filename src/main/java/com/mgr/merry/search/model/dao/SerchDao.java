package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.info.model.vo.InfoUpload;

public interface SerchDao {
   
	List<Map<String,Object>> allList(SqlSessionTemplate session);
	
	List<InfoUpload> subThemaList(SqlSessionTemplate session, Map<String, Object> param);
	
	List<InfoUpload> mainThemaList(SqlSessionTemplate session, String themaNumRef);
	
	List<InfoUpload> localList(SqlSessionTemplate session, int localNum);
	
	
}
