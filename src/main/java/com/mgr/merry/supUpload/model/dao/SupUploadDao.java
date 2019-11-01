package com.mgr.merry.supUpload.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.supUpload.model.vo.SupUploadImg;
import com.mgr.merry.supporters.model.vo.Supporters;

public interface SupUploadDao {

	Map<String, String> selectSupUpload(SqlSessionTemplate session, int infoupNum);

	SupUploadImg selectSupUploadImg(SqlSessionTemplate session, int infoupNum);

	int insertSupUpload(SqlSessionTemplate session, Map<String, String> param);

	Supporters selectSup(SqlSessionTemplate session, int memberNum);

}
