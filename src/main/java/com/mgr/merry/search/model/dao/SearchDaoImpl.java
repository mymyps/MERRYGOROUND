package com.mgr.merry.search.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.info.model.vo.InfoUpload;

@Repository
public class SearchDaoImpl implements SerchDao {

	@Override
	public List<Map<String, Object>> allList(SqlSessionTemplate session) {
	
		return session.selectList("search.allList");
	}

	//�׸��� �ڽ� ����Ʈ(�԰Ÿ�, ��Ÿ� , ī��&�� �����׸� )
	@Override
	public List<InfoUpload> themaList(SqlSessionTemplate session,int themaNum, int themaNumRef) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("themaNum", themaNum);
		map.put("themaNumref", themaNumRef);
		
		return session.selectList("search.themaList1",map);
	}

	// ���̺� �ڽ� ����Ʈ(�ѽ�,�߽�,���....�� �����׸�) 
	@Override
	public List<InfoUpload> themaList(SqlSessionTemplate session,int themaNum) {
		
		return session.selectList("search.themaList2",themaNum);
	}



}
