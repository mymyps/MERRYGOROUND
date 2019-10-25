package com.mgr.merry.couple.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public Map<String, String> selectCoupleBoard(SqlSessionTemplate session, int no) {
		return session.selectOne("couple.selectCoupleBoard",no);
	}
	
	
	

}
