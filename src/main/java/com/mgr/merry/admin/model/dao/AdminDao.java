package com.mgr.merry.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.admin.model.vo.AdminCalendar;

public interface AdminDao {

	int calSave(SqlSessionTemplate sqlSession, AdminCalendar cal);
	List<AdminCalendar> calLoad(SqlSessionTemplate session);
	int calDel(SqlSessionTemplate session, AdminCalendar cal);
	int calMod(SqlSessionTemplate session, AdminCalendar cal);
}