package com.mgr.merry.sign.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.sign.model.vo.Members;
import com.mgr.merry.supporters.model.vo.Supporters;

public interface SignDao {
	int insertMember(SqlSessionTemplate session,Members m);
	Members selectMemberOne(SqlSessionTemplate session,Members m);
	Members selectMember(SqlSessionTemplate session,Members m,int memNo);
	int updateMember(SqlSessionTemplate session,Members m);
	int updatePw(SqlSessionTemplate session,Members m);
	int updateCode(SqlSessionTemplate session,Members m);
	Members selectCp(SqlSessionTemplate session,Members m);
	int updatecupemailcode(SqlSessionTemplate session,Map<String,Object> map);
	int updatecupemailcode2(SqlSessionTemplate session,Map<String,String> emailmap);
	int pwUpdate(SqlSessionTemplate session,Members m);
	int updatesuple(SqlSessionTemplate session,int num);
	Supporters selectSup(SqlSessionTemplate session,int memNo);
//	Map<String,Object> selectSupt3(SqlSessionTemplate session,int supNum);
	List<Object> selectSupt3(SqlSessionTemplate session,int supNum);
	int selectMemberOne2(SqlSessionTemplate session,Members m);
	int inserSupporter(SqlSessionTemplate session, Map<String, Object> data);
	int insertSupporterFile(SqlSessionTemplate session, Map<String, Object> data);
	int updatestatus(SqlSessionTemplate session, Map<String, Object> data);
	Members checkId(SqlSessionTemplate session, Members m);
	int selectBoardCount(SqlSessionTemplate session,int supNum);
	List<Map<String,String>> selectBoardList(SqlSessionTemplate session,int cPage,int numPerPage,int supNum);
	Map<String, String> selectMemberId(SqlSessionTemplate session, String id);
	List selectMemberid2(SqlSessionTemplate session, String id);
	Members selectMemberbyMnum(SqlSessionTemplate session, int memNo);
	int deleteMember(SqlSessionTemplate session, Members m);
	List<Members> searchid(SqlSessionTemplate session, Members m);
}