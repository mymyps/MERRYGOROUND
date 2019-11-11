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
	
	@Override
	public List<Map<String, String>> supBoard(SqlSessionTemplate session) {
		return session.selectList("admin.supBoard");
	}
	
	@Override
	public List<Map<String, String>> supportersList(SqlSessionTemplate session) {
		return session.selectList("admin.supportersList");
	}
	
	@Override
	public List<Map<String, String>> supportersPay(SqlSessionTemplate session) {
		return session.selectList("admin.supportersPay");
	}
	
	@Override
	public List<Map<String, String>> users(SqlSessionTemplate session) {
		return session.selectList("admin.usersAdmin");
	}
	
	@Override
	public List<Map<String, String>> location(SqlSessionTemplate session) {
		return session.selectList("admin.locationAdmin");
	}
	
	@Override
	public List<Map<String, String>> thema(SqlSessionTemplate session) {
		return session.selectList("admin.themaAdmin");
	}
	
	@Override
	public List<Map<String, String>> celtify(SqlSessionTemplate session) {
		return session.selectList("admin.celtify");
	}
	
	@Override
	public int themaAdd(SqlSessionTemplate sesstion, String strTmp) {
		return sesstion.selectOne("admin.themaAdd", strTmp);
	}
	
	@Override
	public int themaAddAdd(SqlSessionTemplate sesstion, String strTmp) {
		return sesstion.insert("admin.themaAddAdd", strTmp);
	}
	
	@Override
	public Map<String, String> celtifyData(SqlSessionTemplate session, int memberNum) {
		return session.selectOne("admin.celtifyData", memberNum);
	}
	
	@Override
	public int cletifyAdmin(SqlSessionTemplate session, int memberNum) {
		return session.update("admin.cletifyAdmin", memberNum);
	}
	
	@Override
	public int calDropSave(SqlSessionTemplate session, AdminCalendar calTmp) {
		return session.update("admin.calDropSave", calTmp);
	}
	
	@Override
	public Map<String, String> adminNotice(SqlSessionTemplate session) {
		return session.selectOne("admin.adminNotice");
	}

	@Override
	public int adminNoticeInsert(SqlSessionTemplate session, String str) {
		return session.insert("admin.adminNoticeInsert", str);
	}
	
	@Override
	public List<Map<String, String>> adminNoticeList(SqlSessionTemplate session) {
		return session.selectList("admin.adminNoticeList");
	}

	@Override
	public int adminNotiDel(SqlSessionTemplate session, int noticeNum) {
		return session.delete("admin.adminNotiDel", noticeNum);
	}
	
	@Override
	public int adminNotiMod(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("admin.adminNotiMod", param);
	}
	
	@Override
	public int cletifyAdminIn(SqlSessionTemplate session, int memberNum) {
		return session.insert("admin.cletifyAdminIn", memberNum);
	}

}