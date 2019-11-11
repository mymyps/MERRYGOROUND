package com.mgr.merry.search.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.search.model.vo.Location;
import com.mgr.merry.search.model.vo.Thema;

@Repository
public class SearchDaoImpl implements SerchDao {

	@Override
	public List<Map<String, Object>> allList(SqlSessionTemplate session) {

		return session.selectList("search.allList");
	}

	@Override
	public List<InfoUpload> subThemaList(SqlSessionTemplate session, Map<String, Object> param, int cPage,
			int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("search.subThemaList", param, rows);
	}

	@Override
	public List<InfoUpload> mainThemaList(SqlSessionTemplate session, int themaNumRef, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("search.mainThemaList", themaNumRef, rows);
	}

	@Override
	public List<InfoUpload> localList(SqlSessionTemplate session, int localNum, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("search.localList", localNum, rows);
	}

	@Override
	public int localCount(SqlSessionTemplate session, int localNum) {
		return session.selectOne("search.localCount", localNum);
	}

	@Override
	public List<Thema> selectThemaList3(SqlSessionTemplate session) {
		return session.selectList("search.themaList3");
	}

	@Override
	public List<Thema> selectThemaList4(SqlSessionTemplate session) {
		return session.selectList("search.themaList4");
	}

	@Override
	public List<Location> selectLocationList(SqlSessionTemplate session) {
		return session.selectList("search.locationList");
	}

	@Override
	public Map<String, String> noticeIndexLoad(SqlSessionTemplate session) {
		return session.selectOne("search.noticeIndexLoad");
	}

	@Override
	public int mainThemaCount(SqlSessionTemplate session, int themaNumRef) {

		return session.selectOne("search.mainThemaCount", themaNumRef);
	}

	@Override
	public int subThemaCount(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("search.subThemaCount", param);
	}

	@Override
	public List<InfoUpload> mapList(SqlSessionTemplate session, String keyword, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("search.mapList", keyword, rows);
	}

	@Override
	public int mapCountAll(SqlSessionTemplate session, String data) {
		return session.selectOne("search.mapCountAll", data);
	}

}