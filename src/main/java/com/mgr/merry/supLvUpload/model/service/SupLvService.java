package com.mgr.merry.supLvUpload.model.service;

import java.util.Map;

import com.mgr.merry.supLvUpload.model.vo.SupLvUploadImg;

public interface SupLvService {

	int insertSupLv(Map<String, String> param, SupLvUploadImg supLvImg) throws Exception;

	int updateSupStatus(String id);

}
