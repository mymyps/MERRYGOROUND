package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.info.model.vo.InfoUpload;

public interface SerchDao {
   
	List<Map<String,Object>> allList(SqlSessionTemplate session);
	
	//메인테마 검색
	List<InfoUpload> themaList(SqlSessionTemplate session, Map<String,Object> param, String themaNumRef);
    //서브테마 검색
	List<InfoUpload> themaList(SqlSessionTemplate session, Map<String,Object> param);
	
	List<InfoUpload> localList(SqlSessionTemplate session, int localNum);
}
