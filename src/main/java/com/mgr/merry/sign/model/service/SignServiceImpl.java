package com.mgr.merry.sign.model.service;


import java.util.Map;

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
	@Override
	public int updatePw(Members m) {
		return dao.updatePw(session,m);
	}
//	@Override
//	public int updateCode(Map<String,String> map) {
//		return dao.updateCode(session,map);
//	}
	@Override
	public int updateCode(Members m) {
		return dao.updateCode(session, m);
	}
//	@Override
//	public int updatecupemailcode(Members m2) {
//		return dao.updatecupemailcode(session, m2);
//	}
	@Override
	public Members selectCp(Members m) {
		return dao.selectCp(session,m);
	}
	@Override
	public int updatecupemailcode(Map<String, Object> map) {
		return dao.updatecupemailcode(session,map);
	}
	@Override
	public int updatecupemailcode2(Map<String, String> emailmap) {
		return dao.updatecupemailcode2(session,emailmap);
	}
	@Override
	public int pwUpdate(Members m) {
		return dao.pwUpdate(session,m);
	}
	@Override
	public int updatesuple(int num) {
		return dao.updatesuple(session,num);
	}
	

}