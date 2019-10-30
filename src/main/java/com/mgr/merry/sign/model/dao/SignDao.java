package com.mgr.merry.sign.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.sign.model.vo.Members;

public interface SignDao {
	int insertMember(SqlSessionTemplate session,Members m);
	Members selectMemberOne(SqlSessionTemplate session,Members m);
	Members selectMember(SqlSessionTemplate session,Members m,int memNo);
	int updateMember(SqlSessionTemplate session,Members m);
	int updatePw(SqlSessionTemplate session,Members m);
//	int updateCode(SqlSessionTemplate session,Map<String,String>map);
	int updateCode(SqlSessionTemplate session,Members m);
//	int updatecupemailcode(SqlSessionTemplate session,Members m2);
	Members selectCp(SqlSessionTemplate session,Members m);
	int updatecupemailcode(SqlSessionTemplate session,Map<String,Object> map);
	int updatecupemailcode2(SqlSessionTemplate session,Map<String,String> emailmap);
	int pwUpdate(SqlSessionTemplate session,Members m);
	int updatesuple(SqlSessionTemplate session,int num);

}