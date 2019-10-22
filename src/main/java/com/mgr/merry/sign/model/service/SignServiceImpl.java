package com.mgr.merry.sign.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mgr.merry.sign.model.dao.SignDao;
import com.mgr.merry.sign.model.vo.Members;

@Service
public class SignServiceImpl implements SignService {
	@Autowired
	SignDao dao;
	@Autowired
	SqlSessionTemplate session;

//    @Autowired
//	BCryptPasswordEncoder passwordEncoder;
	@Override
	public int insertMember(Members m) {
		return dao.insertMember(session,m);
	}

}
