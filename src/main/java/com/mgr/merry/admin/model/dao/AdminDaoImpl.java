package com.mgr.merry.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.admin.model.vo.AdminCalendar;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public int calSave(SqlSessionTemplate sqlSession, AdminCalendar cal) {
		return sqlSession.insert("admin.calSave", cal);
	}
	
	@Override
	public List<AdminCalendar> calLoad(SqlSessionTemplate session) {
		return session.selectList("admin.calLoad");
	}
	
	@Override
	public int calDel(SqlSessionTemplate session, AdminCalendar cal) {
		return session.delete("admin.calDel", cal);
	}
	
	@Override
	public int calMod(SqlSessionTemplate session, AdminCalendar cal) {
		return session.update("admin.calMod", cal);
	}
}