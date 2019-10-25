package com.mgr.merry.info.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class InfoUpload {

   private int infoupNum;
   private int localNum;
   private int supNum;
   private String themaSubNum;
   private String infoupTitle;
   private Date infoupDate;
   private int infoupPayment;
   private String infoupPhone;
   private String infoupTime;
   private String infoupStatus;
 
   //resultType info.model.vo로 받기위해 변수 추가할게요
   private InfoUploadImg InfoUploadImg;
   private com.mgr.merry.search.model.vo.Location Location;
   private com.mgr.merry.search.model.vo.Thema Thema;
   
    //InfoUploadImg
	private int fileNum;
	private String fileReName;
	
	//location
	
	private String localName;
		
	//thema
	
	private String themaName;
	private String themaNum;
	private String themaNumRef;
	private int level;
   
}