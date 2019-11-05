package com.mgr.merry.supUpload.model.service;

import java.util.Map;

import com.mgr.merry.supUpload.model.vo.SupUploadImg;
import com.mgr.merry.supporters.model.vo.Supporters;

public interface SupUploadService {

	Map<String, String> selectSupUpload(int infoupNum);

	SupUploadImg selectSupUploadImg(int infoupNum);

	int insertSupReview(Map<String, String> param);

	Supporters selectSup(int memberNum);

}
