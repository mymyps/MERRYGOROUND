package com.mgr.merry.sign.model.service;

import java.util.List;
import java.util.Map;

import com.mgr.merry.sign.model.vo.Members;
import com.mgr.merry.supLvupload.model.vo.SupLvUpload;
import com.mgr.merry.supLvupload.model.vo.SupLvUploadImg;
import com.mgr.merry.supporters.model.vo.Supporters;

public interface SignService {
	int insertMember(Members m);
	Members selectMemberOne(Members m);
	Members selectMember(Members m,int memNo);
	int updateMember(Members m);
	int updatePw(Members m);
//	int updateCode(Map<String,String> map);
	int updateCode(Members m);
	int updatecupemailcode(Map<String,Object> map);
	int updatecupemailcode2(Map<String,String> emailmap);
	Members selectCp(Members m);
	int pwUpdate(Members m);
//	int updatesuple(int num);
	Supporters selectSup(int memNo);
	Map<String,Object> selectSupt3(int supNum);
	int selectMemberOne2(Members m);
//	SupLvUpload selectSlul(SupLvUpload slut,int slutNum);
//	List<SupLvUploadImg> insertsuplvimg(Map<String,String> param,List<SupLvUploadImg> supuploadimg)throws Exception;
	int insertSupporter(Map<String, Object> data);
	int insertSupporterFile(Map<String, Object> data);
	int updatestatus(Map<String, Object> data);
	Members checkId(Members m);
}