package com.mgr.merry.search.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.search.model.vo.Location;
import com.mgr.merry.search.model.vo.Thema;

public interface SearchService {
List<Map<String,Object>> allList();
	
	//서브테마로 조회
	List<InfoUpload> subThemaList(Map<String, Object> param);

 
	//메인테마로 조회
	List<InfoUpload> mainThemaList(int themaNumRef);
	
	//지역별 검색
	List<InfoUpload> localList(int localNum);
	
	List<Map<String,Object>> mapSearch(Map<String, Object> param);

	List<Thema> selectThemaList3();

	List<Thema> selectThemaList4();

	List<Location> selectLocationList();
	
	Map<String, String> noticeIndexLoad();
	
}