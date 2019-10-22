package com.mgr.merry.couple.model.service;

import java.util.List;
import java.util.Map;

public interface CoupleBoardService {
	int selectCoupleBoardCount();
	List<Map<String,String>> selectCoupleBoardList(int cPage, int numPerPage);
	
	int insertCoupleBoard(Map<String,String> param);
	

}
