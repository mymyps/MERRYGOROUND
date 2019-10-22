package com.mgr.merry.search.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.info.model.vo.InfoUpload;

public interface SearchService {
	
   //모든 리뷰 리스트 불러옴 
	List<Map<String,Object>> allList();
	
	//테마별 코스 리스트
	List<InfoUpload> themaList(int themaNum, int level);

}
