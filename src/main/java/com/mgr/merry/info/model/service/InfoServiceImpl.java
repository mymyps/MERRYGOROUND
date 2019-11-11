package com.mgr.merry.info.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mgr.merry.info.model.dao.InfoDao;
import com.mgr.merry.info.model.vo.InfoUploadImg;
import com.mgr.merry.search.model.vo.Thema;

@Service
public class InfoServiceImpl implements InfoService {
   
   @Autowired
   InfoDao dao;
   
   @Autowired
   SqlSessionTemplate session;
   
   // 수정중
   @Override
   @Transactional(rollbackFor = Exception.class)
   public int insertInfo(Map<String, String> param, InfoUploadImg infoimg) throws Exception {
      int result=0;
      int result2=0;
      
      result=dao.insertInfo(session, param); // info_upload테이블 insert
      
      if(result==0) throw new RuntimeException(); 
      if(result>0) {
         result2=dao.insertInfoImg(session, infoimg); // info_upload_img 
         if(result2==0) throw new RuntimeException(); 
      }
      
      return result;
   }

   // 수정중
   @Override
   public Map<String, String> selectInfo(int infoupNum) {
      return dao.selectInfo(session, infoupNum);
   }

   // 수정중
   @Override
   public InfoUploadImg selectInfoImg(int infoupNum) {
      return dao.selectInfoImg(session, infoupNum);
   }

   // 수정중
//   @Override
//   public int deleteInfo(int infoupNum) {
//      int result=0;
//      result=dao.deleteInfo(session, infoupNum);
//      if(result==0) throw new RuntimeException();
//      
//      return result;
//   }
//
//   @Override
//   public int deleteInfoImg(int infoupNum) {
//      int result=0;
//      result=dao.deleteInfoImg(session, infoupNum);
//      if(result==0) throw new RuntimeException();
//      return 0;
//   }
   
   @Override
   public int infoStatus0(int infoupNum) {
      return dao.updateInfoStatus0(session, infoupNum);
   }

   @Override
   @Transactional(rollbackFor = Exception.class)
   public int updateInfo(Map<String, String> param, InfoUploadImg infoimg, int infoupNum) throws Exception {
      int result=0; // info update
      int result2=0; // img 삭제
      int result3=0; // img insert
      
      result=dao.updateInfo(session, param);
      
      if(result==0) throw new RuntimeException(); 
      if(result>0) {
         result2 = dao.deleteInfoImg(session, infoupNum);
         result3 = dao.insertInfoImg2(session, infoimg);
         if(result2==0) throw new RuntimeException(); 
         if(result3==0) throw new RuntimeException(); 
      }
      
      
      return result;
   }

   @Override
   public Map<String, String> selectSup(Map<String, String> param) {
      return dao.selectSup(session, param);
   }

   @Override
   public List<Map<String, String>> selectSubThema(int themaNumRef) {
      return dao.selectSubThema(session, themaNumRef);
   }



}