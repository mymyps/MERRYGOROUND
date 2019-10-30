package com.mgr.merry.supUpload.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.supUpload.model.vo.SupUploadImg;

public interface SupUploadDao {

	Map<String, String> selectSupUpload(SqlSessionTemplate session, int infoupNum);

	SupUploadImg selectSupUploadImg(SqlSessionTemplate session, int infoupNum);

}
