package com.mgr.merry.info.model.service;

import java.util.Map;


import com.mgr.merry.info.model.vo.InfoUploadImg;

public interface InfoService {

	int insertInfo(Map<String, String> param, InfoUploadImg infoimg) throws Exception;

}
