package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.search.model.vo.Location;
import com.mgr.merry.search.model.vo.Thema;

public interface SerchDao {

	List<Map<String,Object>> allList(SqlSessionTemplate session);
	
	List<InfoUpload> subThemaList(SqlSessionTemplate session, Map<String, Object> param);
	
	List<InfoUpload> mainThemaList(SqlSessionTemplate session, int themaNumRef);
	
	List<InfoUpload> localList(SqlSessionTemplate session, int localNum);
	
	List<Map<String, Object>> mapSearch(SqlSessionTemplate session, Map<String, Object> param);

	List<Thema> selectThemaList3(SqlSessionTemplate session);

	List<Thema> selectThemaList4(SqlSessionTemplate session);

	List<Location> selectLocationList(SqlSessionTemplate session);


}
