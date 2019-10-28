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
	public List<InfoUpload> themaList(Map<String, Object> param) {
		
		String themaNumRef="";
			
		if((int)param.get("level") ==1) { //메인테마라면
			
			//themaList1 로 검색하고 
			
			themaNumRef.equals(param.get("themaNum")); // 메인테마가 100번이라면 100번을 참고하고 있는 모든 list출력 
			return dao.themaList(session,param,themaNumRef);
			
			
		}else { // 서브테마라면
			
			//themaList2 로 검색하세요!
			
			return dao.themaList(session,param);
			
		}
		
		
	}

	@Override
	public List<InfoUpload> localList(int localNum) {
		
		return dao.localList(session, localNum);
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
}