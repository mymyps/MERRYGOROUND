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

}