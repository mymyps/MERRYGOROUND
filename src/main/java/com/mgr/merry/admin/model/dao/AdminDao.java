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
	List<Map<String, String>> boardPage(SqlSessionTemplate session);
	List<Map<String, String>> supBoard(SqlSessionTemplate session);
	List<Map<String, String>> supportersList(SqlSessionTemplate session);
	List<Map<String , String>> supportersPay(SqlSessionTemplate session);
	List<Map<String , String>> users(SqlSessionTemplate session);
	List<Map<String , String>> location(SqlSessionTemplate session);
	List<Map<String , String>> thema(SqlSessionTemplate session);
	List<Map<String , String>> celtify(SqlSessionTemplate session);
	int themaAdd(SqlSessionTemplate sesstion, String strTmp);
	int themaAddAdd(SqlSessionTemplate sesstion, String strTmp);
	Map<String, String> celtifyData(SqlSessionTemplate session, int memberNum);
	int cletifyAdmin(SqlSessionTemplate session, int memberNum);
	int calDropSave(SqlSessionTemplate session, AdminCalendar calTmp);
	Map<String, String> adminNotice(SqlSessionTemplate session);
	int adminNoticeInsert(SqlSessionTemplate session, String str);
	List<Map<String, String>> adminNoticeList(SqlSessionTemplate session);
	int adminNotiDel(SqlSessionTemplate session, int noticeNum);
	int adminNotiMod(SqlSessionTemplate session, Map<String, String> param);
	int cletifyAdminIn(SqlSessionTemplate sqlSession, int memberNum);

}