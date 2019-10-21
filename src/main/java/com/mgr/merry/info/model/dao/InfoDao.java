package com.mgr.merry.info.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.info.model.vo.InfoUploadImg;

public interface InfoDao {

	int insertInfo(SqlSessionTemplate session, Map<String, String> param);

	int insertInfoImg(SqlSessionTemplate session, InfoUploadImg infoimg);



}
