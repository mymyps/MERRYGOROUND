package com.mgr.merry.search.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.info.model.vo.InfoUpload;

public interface SearchService {
	
   //��� ���� ����Ʈ �ҷ��� 
	List<Map<String,Object>> allList();
	
	//�׸��� �ڽ� ����Ʈ
	List<InfoUpload> themaList(int themaNum, int level);

}
