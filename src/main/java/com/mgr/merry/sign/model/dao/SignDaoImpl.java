package com.mgr.merry.sign.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.sign.model.vo.Members;


@Repository
public class SignDaoImpl implements SignDao {

	@Override
	public int insertMember(SqlSessionTemplate session, Members m) {
		System.out.println("@@@@@@@@@@@@@@@@@@"+m);
		return session.insert("sign.insertMember",m);
	}

	@Override
	public Members selectMemberOne(SqlSessionTemplate session, Members m) {
		return session.selectOne("sign.selectMemberOne",m);
	}

	@Override
	public Members selectMember(SqlSessionTemplate session,Members m, int memNo) {
		return session.selectOne("sign.selectMember",memNo);
	}

	@Override
	public int updateMember(SqlSessionTemplate session,Members m) {
//		Map<String,String> map = new HashMap<String,String>();
//		map.put("memberNum",memberNum);
		return session.update("sign.updateMember",m);
	}
	

}