package com.mgr.merry.couple.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mgr.merry.couple.model.dao.CoupleBoardDao;
import com.mgr.merry.couple.model.vo.Attachment;
@Service
public class CoupleBoardServiceImpl implements CoupleBoardService {

	@Autowired
	CoupleBoardDao cdao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int selectCoupleBoardCount() {
		return cdao.selectCoupleBoardCount(session);
	}

	@Override
	public List<Map<String, String>> selectCoupleBoardList(int cPage, int numPerPage) {
		return cdao.selectCoupleBoardList(session,cPage,numPerPage);
	}

	@Override
	public int insertCoupleBoard(Map<String, String> param, List<Attachment> attachList) {
		int result= 0;
		int boardNo = 0;
		result = cdao.insertCoupleBoard(session,param);
		if(result>0) {
			if(attachList.size()>0) {
				for(Attachment a : attachList) {
					//여기서는 vo에 맞는 변수명을 써야하기때문에 coupleNum (update와 다름)
					System.out.println("param.get('coupleNum'): "+param.get("coupleNum"));
					a.setCoupleNum(Integer.parseInt(param.get("coupleNum")));
					System.out.println("aaaa : "+a);
					result = cdao.insertAttachment(session, a);
				}
			}
		}
		return result;
	}

	@Override
	public Map<String, String> selectCoupleBoard(int no) {
		return cdao.selectCoupleBoard(session,no);
	}

	@Override
	public int deleteCoupleBoard(int no) {
		int result=0;
		result =  cdao.deleteCoupleBoard(session, no);
		if(result ==0) throw new RuntimeException();
		
		return result;
	}

	@Override
	public int deleteAttachment(int no) {
		int result=0;
		result =  cdao.deleteAttachment(session, no);
		if(result ==0) throw new RuntimeException();
		
		return result;
	}

	@Override
	public int updateCoupleBoard(Map<String, String> param, List<Attachment> attachList) {
		int result= 0;
		int boardNo = 0;
		result = cdao.updateCoupleBoard(session,param);
		if(result>0) {
			if(attachList.size()>0) {
				for(Attachment a : attachList) {
					//DB에서 가져온 값이기 때문에 컬럼명
					System.out.println("param.get('couplenum'): "+param.get("couplenum"));
					a.setCoupleNum(Integer.parseInt(param.get("couplenum")));
					System.out.println("aaaa : "+a);
					result = cdao.insertAttachment2(session, a);
				}
			}
		}
		return result;
	}

	@Override
	public List<Attachment> selectAttachList(Map<String, String> param) {
		
		return cdao.selectAttachList(session, param);
	}

	@Override
	public int deleteAttachment2(String src) {
		int result=0;
		result =  cdao.deleteAttachment2(session, src);
		System.out.println("serviceimpl에서 result : "+result);
		if(result ==0) throw new RuntimeException();
		
		return result;
	}

	@Override
	public int addComment(Map<String, String> param) {
		return cdao.addComment(session,param);
	}

	@Override
	public List<Map<String, String>> selectCommentList(int coupleNum) {
		return cdao.selectCommentList(session,coupleNum);
	}	
	
	
	

}
