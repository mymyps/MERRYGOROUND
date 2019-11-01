package com.mgr.merry.supUpload.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SupUpload {
	private int infoupNum;
	private int supupNum;
	private int supNum;
	private String supupTitle;
	private String supupContent;
	private Date supupDate;
	private int supupStatus;
}
