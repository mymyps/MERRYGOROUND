package com.mgr.merry.search.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.info.model.vo.InfoUpload;

public interface SearchService {
	
      
//	List<Map<String,Object>> allList();
	
	//테마별 검색 
	List<Map<String,Object>> themaList(int themanum, int level);
	
	//지역별 검색
	List<Map<String,Object>> localList(int localnum);

}
