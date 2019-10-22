package com.mgr.merry.sign.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.sign.model.vo.Members;


@Repository
public class SignDaoImpl implements SignDao {

	@Override
	public int insertMember(SqlSessionTemplate session, Members m) {
		return session.insert("sign.insertMember",m);
	}

}
