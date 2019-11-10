package com.mgr.merry.info.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mgr.merry.info.model.vo.InfoUploadImg;
import com.mgr.merry.search.model.vo.Thema;

public interface InfoDao {

   int insertInfo(SqlSessionTemplate session, Map<String, String> param);

   int insertInfoImg(SqlSessionTemplate session, InfoUploadImg infoimg);

   Map<String, String> selectInfo(SqlSessionTemplate session, int infoupNum);

   InfoUploadImg selectInfoImg(SqlSessionTemplate session, int infoupNum);

   int deleteInfo(SqlSessionTemplate session, int infoupNum);

   int deleteInfoImg(SqlSessionTemplate session, int infoupNum);

   int selectInfoNum(SqlSessionTemplate session);

   int updateInfo(SqlSessionTemplate session, Map<String, String> param);

   int updateInfoStatus0(SqlSessionTemplate session, int infoupNum);

   Map<String, String> selectSup(SqlSessionTemplate session, Map<String, String> param);

   int insertInfoImg2(SqlSessionTemplate session, InfoUploadImg infoimg);

//   List<Thema> selectSubThema(SqlSessionTemplate session, int themaNumRef);



}