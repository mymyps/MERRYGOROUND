package com.mgr.merry.sign.model.service;

import java.util.Map;

import com.mgr.merry.sign.model.vo.Members;

public interface SignService {
	int insertMember(Members m);
	Members selectMemberOne(Members m);
	Members selectMember(Members m,int memNo);
	int updateMember(Members m);
	int updatePw(Members m);
//	int updateCode(Map<String,String> map);
	int updateCode(Members m);
	int updatecupemailcode(Map<String,Object> map);
	int updatecupemailcode2(Map<String,String> emailmap);
	Members selectCp(Members m);
	int pwUpdate(Members m);
	int updatesuple(int num);

}