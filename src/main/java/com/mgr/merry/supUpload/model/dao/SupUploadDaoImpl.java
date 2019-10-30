package com.mgr.merry.supUpload.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.supUpload.model.vo.SupUploadImg;

@Repository
public class SupUploadDaoImpl implements SupUploadDao {

	@Override
	public Map<String, String> selectSupUpload(SqlSessionTemplate session, int infoupNum) {
		return session.selectOne("supUp.selectSupUpload", infoupNum);
	}

	@Override
	public SupUploadImg selectSupUploadImg(SqlSessionTemplate session, int infoupNum) {
		return session.selectOne("supUp.selectSupUploadImg", infoupNum);
	}


}
