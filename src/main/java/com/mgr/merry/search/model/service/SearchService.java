package com.mgr.merry.search.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.info.model.vo.InfoUpload;

public interface SearchService {
	
      
	List<Map<String,Object>> allList();
	
	//테마별 검색 
	List<InfoUpload> themaList(int themaNum, int themaLevel);

}
