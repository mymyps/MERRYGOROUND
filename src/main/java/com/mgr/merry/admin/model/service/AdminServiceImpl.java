package com.mgr.merry.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.merry.admin.model.dao.AdminDao;
import com.mgr.merry.admin.model.vo.AdminCalendar;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int calSave(AdminCalendar cal) {
		return dao.calSave(sqlSession, cal);
	}
	
	@Override
	public List<AdminCalendar> calLoad() {
		return dao.calLoad(sqlSession);
	}
	
	@Override
	public int calDel(AdminCalendar cal) {
		return dao.calDel(sqlSession, cal);
	}
	
	@Override
	public int calMod(AdminCalendar cal) {
		return dao.calMod(sqlSession, cal);
	}
	
	@Override
	public List<Map<String, String>> adminThemaMain() {
		return dao.adminThemaMain(sqlSession);
	}
	
	@Override
	public int topInfoUpload() {
		return dao.topInfoUpload(sqlSession);
	}
	
	@Override
	public int topCouple() {
		return dao.topCouple(sqlSession);
	}
	
	@Override
	public int topSupporters() {
		return dao.topSupporters(sqlSession);
	}
	
	@Override
	public int topSupStatus() {
		return dao.topSupStatus(sqlSession);
	}
	
	@Override
	public List<Map<String, String>> uploadTop() {
		return dao.uploadTop(sqlSession);
	}
	
	@Override
	public List<Map<String, String>> supPayMain() {
		return dao.supPayMain(sqlSession);
	}
	
	
}