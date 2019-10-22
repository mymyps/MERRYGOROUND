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

		if(level ==1) { //���� �׸����

			//themaList1 ������ �˻��ϰ� 

			themaNumRef = themanum; // �����׸��� 100���̸� ������ȣ 100���� �����׸� �� ��ȸ�� 
			return dao.themaList(session,themanum,themaNumRef);


		}else { // �����׸���

			//themaList2 ������ �˻�

			return dao.themaList(session,themanum);

		}


	}
}