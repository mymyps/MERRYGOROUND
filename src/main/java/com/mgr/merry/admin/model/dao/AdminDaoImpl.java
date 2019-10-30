package com.mgr.merry.admin.model.dao;

import java.util.List;
import java.util.Map;

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
	
	@Override
	public List<Map<String, String>> adminThemaMain(SqlSessionTemplate session) {
		return session.selectList("admin.adminThemaMain");
	}
	
	@Override
	public int topInfoUpload(SqlSessionTemplate session) {
		return session.selectOne("admin.topInfoUpload");
	}
	
	@Override
	public int topCouple(SqlSessionTemplate session) {
		return session.selectOne("admin.topCouple");
	}
	
	@Override
	public int topSupporters(SqlSessionTemplate session) {
		return session.selectOne("admin.topSupporters");
	}
	
	@Override
	public int topSupStatus(SqlSessionTemplate session) {
		return session.selectOne("admin.topSupStatus");
	}
	
	@Override
	public List<Map<String, String>> uploadTop(SqlSessionTemplate session) {
		return session.selectList("admin.uploadTopMain");
	}
	
	@Override
	public List<Map<String, String>> supPayMain(SqlSessionTemplate session) {
		return session.selectList("admin.supPayMain");
	}
	
	@Override
	public List<Map<String, String>> supListMain(SqlSessionTemplate session) {
		return session.selectList("admin.supListMain");
	}
	
	@Override
	public List<Map<String, String>> supConfirmMain(SqlSessionTemplate session) {
		return session.selectList("admin.supConfirmMain");
	}
	
	@Override
	public List<Map<String, String>> infoUploadMain(SqlSessionTemplate session) {
		return session.selectList("admin.infoUploadMain");
	}
	
	@Override
	public List<Map<String, String>> boardPage(SqlSessionTemplate session) {
		return session.selectList("admin.boardPage");
	}
	
	
	

}