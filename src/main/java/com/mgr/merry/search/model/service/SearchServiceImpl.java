package com.mgr.merry.search.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.search.model.dao.SerchDao;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	SerchDao dao;

	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Map<String, Object>> allList() {

		return dao.allList(session);
	}

	@Override
	public List<InfoUpload> subThemaList(Map<String, Object> param) {

		return dao.subThemaList(session, param);
	}

	@Override
	public List<InfoUpload> localList(int localNum) {

		return dao.localList(session, localNum);
	}

	@Override
	public List<InfoUpload> mainThemaList(String themaNumRef) {
		
		return dao.mainThemaList(session, themaNumRef);
	}

}
