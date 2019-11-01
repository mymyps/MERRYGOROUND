package com.mgr.merry.couple.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Attachment {
	private int attachmentNo;
	private int coupleNum;
	private String fileRename;
	private Date uploadDate;
	private int flag;
	
}
