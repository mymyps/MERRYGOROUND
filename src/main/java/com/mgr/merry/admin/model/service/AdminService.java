package com.mgr.merry.admin.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.admin.model.vo.AdminCalendar;


public interface AdminService {
	
	int calSave(AdminCalendar cal);
	List<AdminCalendar> calLoad();
	int calDel(AdminCalendar cal);
	int calMod(AdminCalendar cal);
	List<Map<String, String>> adminThemaMain();
	int topInfoUpload();
	int topSupporters();
	int topSupStatus();
	int topCouple();
	List<Map<String, String>> uploadTop();
	List<Map<String, String>> supPayMain();
	List<Map<String, String>> supListMain();
	List<Map<String, String>> supConfirmMain();
	List<Map<String, String>> infoUploadMain();
	List<Map<String, String>> boardPage();
	List<Map<String , String>> supBoard();
	List<Map<String , String>> supportersList();
	List<Map<String , String>> supportersPay();
	List<Map<String , String>> users();
	List<Map<String , String>> location();
	List<Map<String , String>> thema();
	List<Map<String , String>> celtify();
	int themaAdd(String strTmp);
	int themaAddAdd(String strTmp);
	Map<String, String> celtifyData(int memberNum);
	int cletifyAdmin(int memberNum);
	int calDropSave(AdminCalendar calTmp);
	Map<String, String> adminNotice();
	Map<String, String> adminNoticeInsert(String str) throws Exception;
	List<Map<String, String>> adminNoticeList();
	int adminNotiDel(int noticeNum);
	int adminNotiMod(Map<String, String> param);


}