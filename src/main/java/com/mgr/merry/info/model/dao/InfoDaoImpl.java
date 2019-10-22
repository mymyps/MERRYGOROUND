package com.mgr.merry.info.model.dao;

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
//
//	@Override
//	public Map<String, String> selectInfo(SqlSessionTemplate session, int infoNum) {
//		return session.selectOne("info.selectInfo", infoNum);
//	}
//
//	@Override
//	public InfoUploadImg selectInfoImg(SqlSessionTemplate session, int infoNum) {
//		return session.selectOne("info.selectInfoImg", infoNum);
//	}




}
