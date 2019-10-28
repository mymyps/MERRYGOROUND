package com.mgr.merry.sign.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.sign.model.vo.Members;

public interface SignDao {
	int insertMember(SqlSessionTemplate session,Members m);
	Members selectMemberOne(SqlSessionTemplate session,Members m);
	Members selectMember(SqlSessionTemplate session,Members m,int memNo);
	int updateMember(SqlSessionTemplate session,Members m);
}