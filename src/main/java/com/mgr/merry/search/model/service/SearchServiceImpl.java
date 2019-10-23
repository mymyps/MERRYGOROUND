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

		if(level ==1) { //메인테마라면

			//themaList1 로 검색하고 

			themaNumRef = themanum; // 메인테마가 100번이라면 100번을 참고하고 있는 모든 list출력 
			return dao.themaList(session,themanum,themaNumRef);


		}else { // 서브테마라면

			//themaList2 로 검색하세요!

			return dao.themaList(session,themanum);

		}
	}
}
