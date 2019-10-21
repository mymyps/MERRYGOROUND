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
   
}
