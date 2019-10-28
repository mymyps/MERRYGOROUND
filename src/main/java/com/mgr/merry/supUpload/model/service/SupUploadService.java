package com.mgr.merry.supUpload.model.service;

import java.util.Map;

import com.mgr.merry.supUpload.model.vo.SupUploadImg;

public interface SupUploadService {

	Map<String, String> selectSupUpload(int infoupNum);

	SupUploadImg selectSupUploadImg(int infoupNum);

}
