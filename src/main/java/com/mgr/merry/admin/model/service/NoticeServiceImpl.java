package com.mgr.merry.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.merry.admin.model.dao.NoticeDao;
import com.mgr.merry.search.model.dao.SerchDao;

@Service
public class NoticeServiceImpl implements NoticeService {
	

	@Autowired
	NoticeDao dao;

	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Map<String, Object>> noticeList() {
		
			return dao.noticeList(session);
		}
	}


