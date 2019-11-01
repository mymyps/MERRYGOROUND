package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.search.model.vo.Location;
import com.mgr.merry.search.model.vo.Thema;

public interface SerchDao {

	List<Map<String,Object>> allList(SqlSessionTemplate session);

	//메인테마 검색
	List<InfoUpload> themaList(SqlSessionTemplate session, Map<String,Object> param, String themaNumRef);
	//서브테마 검색
	List<InfoUpload> themaList(SqlSessionTemplate session, Map<String,Object> param);

	List<InfoUpload> subThemaList(SqlSessionTemplate session, Map<String, Object> param);

	List<InfoUpload> mainThemaList(SqlSessionTemplate session, String themaNumRef);

	List<InfoUpload> localList(SqlSessionTemplate session, int localNum);

	List<Thema> selectThemaList3(SqlSessionTemplate session);

	List<Thema> selectThemaList4(SqlSessionTemplate session);

	List<Location> selectLocationList(SqlSessionTemplate session);


}
