package com.mgr.merry.supLvUpload.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.supLvUpload.model.vo.SupLvUploadImg;

public interface SupLvDao {

	int insertSupLv(SqlSessionTemplate session, Map<String, String> param);

	int insertSupLvImg(SqlSessionTemplate session, SupLvUploadImg supLvImg);

	int updateSupStatus(SqlSessionTemplate session, String id);

}
