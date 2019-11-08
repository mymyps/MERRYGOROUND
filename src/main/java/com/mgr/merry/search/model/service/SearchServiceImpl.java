package com.mgr.merry.search.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.search.model.dao.SerchDao;
import com.mgr.merry.search.model.vo.Location;
import com.mgr.merry.search.model.vo.Thema;

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
	public List<InfoUpload> mainThemaList(int themaNumRef) {
		
		return dao.mainThemaList(session, themaNumRef);
	}

	@Override
	public List<Map<String,Object>> mapSearch(Map<String, Object> param) {
		
		return dao.mapSearch(session, param);
	}
	
	@Override
	public List<Thema> selectThemaList3() {
		return dao.selectThemaList3(session);
	}


	@Override
	public List<Thema> selectThemaList4() {
		return dao.selectThemaList4(session);
	}


	@Override
	public List<Location> selectLocationList() {
		return dao.selectLocationList(session);
	}

	@Override
	public Map<String, String> noticeIndexLoad() {
		return dao.noticeIndexLoad(session);
	}

}
