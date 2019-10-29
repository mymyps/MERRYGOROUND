package com.mgr.merry.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.admin.model.vo.AdminCalendar;

public interface AdminDao {

	int calSave(SqlSessionTemplate sqlSession, AdminCalendar cal);
	List<AdminCalendar> calLoad(SqlSessionTemplate session);
	int calDel(SqlSessionTemplate session, AdminCalendar cal);
	int calMod(SqlSessionTemplate session, AdminCalendar cal);
	List<Map<String, String>> adminThemaMain(SqlSessionTemplate session);
	int topInfoUpload(SqlSessionTemplate session);
	int topSupporters(SqlSessionTemplate session);
	int topSupStatus(SqlSessionTemplate session);
	int topCouple(SqlSessionTemplate session);
	List<Map<String, String>> uploadTop(SqlSessionTemplate session);
	List<Map<String, String>> supPayMain(SqlSessionTemplate session);
	List<Map<String, String>> supListMain(SqlSessionTemplate session);
	List<Map<String, String>> supConfirmMain(SqlSessionTemplate session);
	List<Map<String, String>> infoUploadMain(SqlSessionTemplate session);
}