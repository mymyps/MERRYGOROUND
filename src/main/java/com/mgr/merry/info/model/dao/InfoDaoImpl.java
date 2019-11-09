package com.mgr.merry.info.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.info.model.vo.InfoUploadImg;

@Repository
public class InfoDaoImpl implements InfoDao {

	@Override
	public int insertInfo(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("info.insertInfo", param);
	}

	@Override
	public int insertInfoImg(SqlSessionTemplate session, InfoUploadImg infoimg) {
		return session.insert("info.insertInfoImg", infoimg);
	}

	@Override
	public Map<String, String> selectInfo(SqlSessionTemplate session, int infoupNum) {
		return session.selectOne("info.selectInfo", infoupNum);
	}

	@Override
	public InfoUploadImg selectInfoImg(SqlSessionTemplate session, int infoupNum) {
		return session.selectOne("info.selectInfoImg", infoupNum);
	}

	@Override
	public int deleteInfo(SqlSessionTemplate session, int infoupNum) {
		return session.delete("info.deleteInfo", infoupNum);
	}

	@Override
	public int deleteInfoImg(SqlSessionTemplate session, int infoupNum) {
		return session.delete("info.deleteInfoImg", infoupNum);
	}

	@Override
	public int selectInfoNum(SqlSessionTemplate session) {
		return session.selectOne("info.selectInfoNum");
	}

	@Override
	public int updateInfo(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("info.updateInfo", param);
	}

	@Override
	public int updateInfoStatus0(SqlSessionTemplate session, int infoupNum) {
		return session.update("info.updateInfoStatus0", infoupNum);
	}

	@Override
	public Map<String, String> selectSup(SqlSessionTemplate session, Map<String, String> param) {
		return session.selectOne("info.selectSup", param);
	}

	@Override
	public int insertInfoImg2(SqlSessionTemplate session, InfoUploadImg infoimg) {
		return session.insert("info.insertInfoImg2", infoimg);
	}




}
