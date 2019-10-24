package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.info.model.vo.InfoUpload;

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
	public List<InfoUpload> localList(SqlSessionTemplate session, int localNum) {
	
		return session.selectList("search.localList",localNum);
	}



}
