package com.mgr.merry.info.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class InfoUpload {

   private int infoupNum;
   private int localNum;
   private int supNum;
   private String infoupTitle;
   private Date infoupDate;
   private int infoupPayment;
   private String infoupPhone;
   private String infoupTime;
   private String infoupStatus;
   private String infoAddr;
 
   //테이블 join해서 resultType info.model.vo로 받기위해 변수 추가할게요(info_upload , infoupimg, thema, location 4개 테이블 조인)
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