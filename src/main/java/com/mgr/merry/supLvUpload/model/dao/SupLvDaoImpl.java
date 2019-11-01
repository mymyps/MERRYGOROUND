package com.mgr.merry.supLvUpload.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.supLvUpload.model.vo.SupLvUploadImg;

@Repository
public class SupLvDaoImpl implements SupLvDao {

	@Override
	public int insertSupLv(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("supLv.insertSupLv", param);
	}

	@Override
	public int insertSupLvImg(SqlSessionTemplate session, SupLvUploadImg supLvImg) {
		return session.insert("supLv.insertSupLvImg", supLvImg);
	}

}
