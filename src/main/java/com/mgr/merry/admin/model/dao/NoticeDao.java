package com.mgr.merry.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface NoticeDao {
	
	List<Map<String,Object>> noticeList(SqlSessionTemplate session);
	
	

}
