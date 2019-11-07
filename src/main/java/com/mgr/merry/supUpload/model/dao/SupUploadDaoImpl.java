package com.mgr.merry.supUpload.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mgr.merry.supUpload.model.vo.SupUploadImg;
import com.mgr.merry.supporters.model.vo.Supporters;

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

	@Override
	public int insertSupUpload(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("supUp.insertSupUpload", param);
	}

	@Override
	public Supporters selectSup(SqlSessionTemplate session, int memberNum) {
		return session.selectOne("supUp.selectSup", memberNum);
	}

	@Override
	public Supporters selectSupId(SqlSessionTemplate session, String id) {
		return session.selectOne("supUp.selectSupId", id);
	}

	@Override
	public int insertSupUploadImg(SqlSessionTemplate session, SupUploadImg supImg) {
		return session.insert("supUp.insertSupUploadImg", supImg);
	}

	@Override
	public int updateSupReview(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("supUp.updateSupUpload", param);
	}

	@Override
	public int supRvStatus0(SqlSessionTemplate session, int infoupNum) {
		return session.update("supUp.updateSupRvState0", infoupNum);
	}



}
