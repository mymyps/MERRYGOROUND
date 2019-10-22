package com.mgr.merry.sign.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.sign.model.vo.Members;



public interface SignDao {
	int insertMember(SqlSessionTemplate session,Members m);
}
