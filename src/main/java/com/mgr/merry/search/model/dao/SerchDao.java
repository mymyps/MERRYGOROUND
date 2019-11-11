package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.search.model.vo.Location;
import com.mgr.merry.search.model.vo.Thema;

public interface SerchDao {

	List<Map<String,Object>> allList(SqlSessionTemplate session);
	
	List<InfoUpload> subThemaList(SqlSessionTemplate session, Map<String, Object> param, int cPage, int numPerPage);
	int subThemaCount(SqlSessionTemplate session, Map<String, Object> param);
	
	List<InfoUpload> mainThemaList(SqlSessionTemplate session, int themaNumRef, int cPage, int numPerPage);
	
	List<InfoUpload> localList(SqlSessionTemplate session, int localNum, int cPage, int numPerPage);
	int localCount(SqlSessionTemplate session, int localNum);
	
	int mainThemaCount(SqlSessionTemplate session, int themaNumRef);
	
	List<Map<String, Object>> mapSearch(SqlSessionTemplate session, Map<String, Object> param);

	List<Thema> selectThemaList3(SqlSessionTemplate session);

	List<Thema> selectThemaList4(SqlSessionTemplate session);

	List<Location> selectLocationList(SqlSessionTemplate session);

	Map<String, String> noticeIndexLoad(SqlSessionTemplate session);

}
