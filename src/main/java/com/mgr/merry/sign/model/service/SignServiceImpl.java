package com.mgr.merry.sign.model.service;


import java.util.List;

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
	

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Override
	public int insertMember(Members m) {
		return dao.insertMember(session,m);
	}
	@Override
	public Members selectMemberOne(Members m) {
		return dao.selectMemberOne(session,m);
	}
	@Override
	public Members selectMember(Members m,int memNo) {
		return dao.selectMember(session,m, memNo);
	}
	@Override
	public int updateMember(Members m) {
		return dao.updateMember(session,m);
	}

}