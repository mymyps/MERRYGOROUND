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
	public List<InfoUpload> themaList(int themanum, int level) {
		
		int themaNumRef=0;
		
		if(level ==1) { //메인 테마라면
			
			//themaList1 쿼리로 검색하고 
			
		    themaNumRef = themanum; // 메인테마가 100번이면 참조번호 100번인 서브테마 다 조회됨 
			return dao.themaList(session,themanum,themaNumRef);
			
			
		}else { // 서브테마면
			
			//themaList2 쿼리로 검색
			
			return dao.themaList(session,themanum);
			
		}
		
		
	}
	
		
		
	}

}
