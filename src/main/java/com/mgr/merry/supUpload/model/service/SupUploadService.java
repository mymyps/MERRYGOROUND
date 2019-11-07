package com.mgr.merry.supUpload.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.mgr.merry.supUpload.model.vo.SupUploadImg;
import com.mgr.merry.supporters.model.vo.Supporters;

public interface SupUploadService {

	Map<String, String> selectSupUpload(int infoupNum);

	SupUploadImg selectSupUploadImg(int infoupNum);

	int insertSupReview(Map<String, String> param);

	Supporters selectSup(int memberNum);

	void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	Supporters selectSupId(String id);

	int insertSupUploadImg(Map<String, String> param, List<SupUploadImg> imgList);

	int updateSupReview(Map<String, String> param);

	int supRvStatus0(int infoupNum);

}
