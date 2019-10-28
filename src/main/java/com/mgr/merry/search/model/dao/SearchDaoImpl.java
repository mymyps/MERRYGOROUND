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

	

}
