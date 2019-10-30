package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.search.model.vo.Location;
import com.mgr.merry.search.model.vo.Thema;

@Repository
public class SearchDaoImpl implements SerchDao {

	@Override
	public List<Map<String, Object>> allList(SqlSessionTemplate session) {

		return session.selectList("search.allList");
	}

	//메인테마 조회 
	@Override
	public List<InfoUpload> themaList(SqlSessionTemplate session,Map<String,Object> param, String themaNumRef) {

		param.put("themaNumRef", themaNumRef);

		return session.selectList("search.themaList1",param);
	}

	// 서브테마 조회
	@Override
	public List<InfoUpload> themaList(SqlSessionTemplate session, Map<String,Object> param) {

		return session.selectList("search.themaList2",param);
	}

	@Override
	public List<InfoUpload> subThemaList(SqlSessionTemplate session, Map<String, Object> param) {

		return session.selectList("search.subThemaList", param);
	}

	@Override
	public List<InfoUpload> mainThemaList(SqlSessionTemplate session, String themaNumRef) {

		return session.selectList("search.mainThemaList",themaNumRef);
	}

	@Override
	public List<InfoUpload> localList(SqlSessionTemplate session, int localNum) {

		return session.selectList("search.localList", localNum);
	}

	@Override
	public List<Thema> selectThemaList3(SqlSessionTemplate session) {
		return session.selectList("search.themaList3");
	}

	@Override
	public List<Thema> selectThemaList4(SqlSessionTemplate session) {
		return session.selectList("search.themaList4");
	}

	@Override
	public List<Location> selectLocationList(SqlSessionTemplate session) {
		return session.selectList("search.locationList");
	}

}