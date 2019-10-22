package com.mgr.merry.couple.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.merry.couple.model.dao.CoupleBoardDao;
@Service
public class CoupleBoardServiceImpl implements CoupleBoardService {

	@Autowired
	CoupleBoardDao cdao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int selectCoupleBoardCount() {
		return cdao.selectCoupleBoardCount(session);
	}

	@Override
	public List<Map<String, String>> selectCoupleBoardList(int cPage, int numPerPage) {
		return cdao.selectCoupleBoardList(session,cPage,numPerPage);
	}

	@Override
	public int insertCoupleBoard(Map<String, String> param) {
		int result= 0;
		int boardNo = 0;
		result = cdao.insertCoupleBoard(session,param);
//		if(result==0) throw new Exception();
		
		return result;
	}
	
	
	

}
