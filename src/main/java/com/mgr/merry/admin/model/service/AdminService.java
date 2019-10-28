package com.mgr.merry.admin.model.service;

import java.util.List;

import com.mgr.merry.admin.model.vo.AdminCalendar;


public interface AdminService {
	
	int calSave(AdminCalendar cal);
	List<AdminCalendar> calLoad();
	int calDel(AdminCalendar cal);
	int calMod(AdminCalendar cal);

}