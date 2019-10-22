package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.info.model.vo.InfoUpload;

public interface SerchDao {
	
	List<Map<String,Object>> allList(SqlSessionTemplate session);
	
	//테마별 코스 리스트 메인테마

	List<InfoUpload> themaList(SqlSessionTemplate session, int themaNum, int themaNumRef);
	
	
	//테마별 코스 리스트 디테일 테마 

	List<InfoUpload> themaList(SqlSessionTemplate session, int themaNum);
}
