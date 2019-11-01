package com.mgr.merry.sign.model.service;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mgr.merry.sign.model.dao.SignDao;
import com.mgr.merry.sign.model.vo.Members;
import com.mgr.merry.supLvupload.model.vo.SupLvUpload;
import com.mgr.merry.supLvupload.model.vo.SupLvUploadImg;
import com.mgr.merry.supporters.model.vo.Supporters;

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
//	@Override
//	public int updatesuple(int num) {
//		return dao.updatesuple(session,num);
//	}
	
	@Override
	public Supporters selectSup(int memNo) {
		return dao.selectSup(session, memNo);
	}
	@Override
	public Map<String, Object> selectSupt3(int supNum) {
		return dao.selectSupt3(session,supNum);
	}
	@Override
	public int selectMemberOne2(Members m) {
		return dao.selectMemberOne2(session,m);
	}
//	@Override
//	public int insertsuplvimg(Map<String, String> param, List<SupLvUploadImg> supuploadimg) throws Exception {
//		int result2=0;
//		result2=dao.insertsuplvimg(session,param);//board���̺� ������ �Է�!
//		if(result2==0) throw new RuntimeException();
//		//result=0;
//		if(supuploadimg.size()>0) {
//			for(SupLvUploadImg a : supuploadimg) {
//				a.setSuplvNum(Integer.parseInt(param.get("supNo")));
//				result2=dao.insertsuplvimg(session,a);
//				if(result2==0) throw new Exception();
//			}
//		}
//		
//		return result2;
//	}
//	@Override
//	public SupLvUpload selectSlul(SupLvUpload slut, int slutNum) {
//		return dao.selectSlul(session,slutNum);
//	}
	@Override
	public int insertSupporter(Map<String, Object> data) {
		return dao.inserSupporter(session, data);
	}
	@Override
	public int insertSupporterFile(Map<String, Object> data) {
		return dao.insertSupporterFile(session, data);
	}
	@Override
	public int updatestatus(Map<String, Object> data) {
		return dao.updatestatus(session,data);
	}
	@Override
	public Members checkId(Members m) {
		return dao.checkId(session,m);
	}
	

	
	
}