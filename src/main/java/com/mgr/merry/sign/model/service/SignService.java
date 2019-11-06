package com.mgr.merry.sign.model.service;

import java.util.Map;

import com.mgr.merry.sign.model.vo.Members;
import com.mgr.merry.supporters.model.vo.Supporters;

public interface SignService {
	int insertMember(Members m);
	Members selectMemberOne(Members m);
	Members selectMember(Members m,int memNo);
	int updateMember(Members m);
	int updatePw(Members m);
	int updateCode(Members m);
	int updatecupemailcode(Map<String,Object> map);
	int updatecupemailcode2(Map<String,String> emailmap);
	Members selectCp(Members m);
	int pwUpdate(Members m);
	Supporters selectSup(int memNo);
	Map<String,Object> selectSupt3(int supNum);
	int selectMemberOne2(Members m);
	int insertSupporter(Map<String, Object> data);
	int insertSupporterFile(Map<String, Object> data);
	int updatestatus(Map<String, Object> data);
	Members checkId(Members m);
}