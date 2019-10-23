package com.mgr.merry.search.model.dao;

import java.util.HashMap;
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

	//테마별 코스 리스트(먹거리, 놀거리 , 카페&술 메인테마 )
	@Override
	public List<InfoUpload> themaList(SqlSessionTemplate session,int themaNum, int themaNumRef) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("themaNum", themaNum);
		map.put("themaNumref", themaNumRef);
		
		return session.selectList("search.themaList1",map);
	}

	// 테이별 코스 리스트(한식,중식,양식....등 서브테마) 
	@Override
	public List<InfoUpload> themaList(SqlSessionTemplate session,int themaNum) {
		
		return session.selectList("search.themaList2",themaNum);
	}



}
