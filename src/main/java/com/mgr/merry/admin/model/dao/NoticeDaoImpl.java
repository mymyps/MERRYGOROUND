package com.mgr.merry.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<Map<String, Object>> noticeList(SqlSessionTemplate session) {
		
		return session.selectList("notice.noticeList");
	}

}
