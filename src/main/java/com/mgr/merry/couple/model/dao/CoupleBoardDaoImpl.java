package com.mgr.merry.couple.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.couple.model.vo.Attachment;

@Repository
public class CoupleBoardDaoImpl implements CoupleBoardDao {

	@Override
	public int selectCoupleBoardCount(SqlSessionTemplate session) {
		return session.selectOne("couple.selectCoupleBoardCount");
	}

	@Override
	public List<Map<String, String>> selectCoupleBoardList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("couple.selectCoupleBoardList",null,rows);
	}

	@Override
	public int insertCoupleBoard(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("couple.insertCoupleBoard",param);
	}
	
	@Override
	public int insertAttachment(SqlSessionTemplate session, Attachment att) {
		return session.insert("couple.insertAttachment",att);
	}

	@Override
	public Map<String, String> selectCoupleBoard(SqlSessionTemplate session, int no) {
		return session.selectOne("couple.selectCoupleBoard",no);
	}

	@Override
	public int deleteCoupleBoard(SqlSessionTemplate session, int no) {
		return session.delete("couple.deleteCoupleBoard",no);
	}

	@Override
	public int deleteAttachment(SqlSessionTemplate session, int no) {
		return session.delete("couple.deleteAttachment", no);
	}

	@Override
	public int updateCoupleBoard(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("couple.updateCoupleBoard",param);
	}

	@Override
	public int insertAttachment2(SqlSessionTemplate session, Attachment att) {
		return session.update("couple.insertAttachment2",att);
	}

	@Override
	public List<Attachment> selectAttachList(SqlSessionTemplate session, Map<String, String> param) {
		return session.selectList("couple.selectAttachList", param);
	}

	@Override
	public int deleteAttachment2(SqlSessionTemplate session, String src) {
		return session.delete("couple.deleteAttachment2", src);
	}
	
	
	
	
	
	

}