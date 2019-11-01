package com.mgr.merry.sign.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.sign.model.vo.Members;
import com.mgr.merry.supporters.model.vo.Supporters;

@Repository
public class SignDaoImpl implements SignDao {

	@Override
	public int insertMember(SqlSessionTemplate session, Members m) {
		System.out.println("@@@@@@@@@@@@@@@@@@" + m);
		return session.insert("sign.insertMember", m);
	}

	@Override
	public Members selectMemberOne(SqlSessionTemplate session, Members m) {
		return session.selectOne("sign.selectMemberOne", m);
	}

	@Override
	public Members selectMember(SqlSessionTemplate session, Members m, int memNo) {
		return session.selectOne("sign.selectMember", memNo);
	}

	@Override
	public int updateMember(SqlSessionTemplate session, Members m) {
//		Map<String,String> map = new HashMap<String,String>();
//		map.put("memberNum",memberNum);
		return session.update("sign.updateMember", m);
	}

	@Override
	public int updatePw(SqlSessionTemplate session, Members m) {
		return session.update("sign.updatePw", m);
	}

//	@Override
//	public int updateCode(SqlSessionTemplate session,Map<String,String> map) {
//		return session.update("sign.updateCode",map);
//	}
	@Override
	public int updateCode(SqlSessionTemplate session, Members m) {
		return session.update("sign.updateCode", m);
	}

//	@Override
//	public int updatecupemailcode(SqlSessionTemplate session, Members m2) {
//		return session.update("sign.updatecupemailcode",m2);
//	}

	@Override
	public Members selectCp(SqlSessionTemplate session, Members m) {
		return session.selectOne("sign.selectCp", m);
	}

	@Override
	public int updatecupemailcode(SqlSessionTemplate session, Map<String, Object> map) {
		System.out.println("daoimpl1" + map);
		return session.update("sign.updatecupemailcode", map);
	}

	@Override
	public int updatecupemailcode2(SqlSessionTemplate session, Map<String, String> emailmap) {
		System.out.println("daoimpl2" + emailmap);
		return session.update("sign.updatecupemailcode2", emailmap);
	}

	@Override
	public int pwUpdate(SqlSessionTemplate session, Members m) {
		return session.update("sign.pwUpdate", m);
	}

	@Override
	public int updatesuple(SqlSessionTemplate session, int num) {
		return session.update("sign.updatesuple", num);
	}

	@Override
	public Supporters selectSup(SqlSessionTemplate session, int memNo) {
		return session.selectOne("sign.selectSup", memNo);
	}

	@Override
	public Map<String, Object> selectSupt3(SqlSessionTemplate session, int supNum) {
		return session.selectOne("sign.selectSupt3", supNum);
	}

	@Override
	public int selectMemberOne2(SqlSessionTemplate session, Members m) {
		return session.selectOne("sign.selectMemberOne2", m);
	}

	@Override
	public int inserSupporter(SqlSessionTemplate session, Map<String, Object> data) {
		System.out.println("#@!@@"+session.insert("sign.insertSupporter", data));
		return session.insert("sign.insertSupporter", data);
	}

	@Override
	public int insertSupporterFile(SqlSessionTemplate session, Map<String, Object> data) {
		return session.insert("sign.insertSupporterFile", data);
	}

	@Override
	public int updatestatus(SqlSessionTemplate session, Map<String, Object> data) {
		return session.update("sign.updatestatus",data);
	}

	@Override
	public Members checkId(SqlSessionTemplate session, Members m) {
		return session.selectOne("sign.checkId",m);
	}
	

}