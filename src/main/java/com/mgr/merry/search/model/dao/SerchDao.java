package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.info.model.vo.InfoUpload;

public interface SerchDao {
	
	List<Map<String,Object>> allList(SqlSessionTemplate session);
	
	//�׸��� �ڽ� ����Ʈ �����׸�

	List<InfoUpload> themaList(SqlSessionTemplate session, int themaNum, int themaNumRef);
	
	
	//�׸��� �ڽ� ����Ʈ ������ �׸� 

	List<InfoUpload> themaList(SqlSessionTemplate session, int themaNum);
}
