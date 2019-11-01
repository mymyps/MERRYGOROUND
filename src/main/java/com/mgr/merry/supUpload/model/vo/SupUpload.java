package com.mgr.merry.supUpload.model.vo;

import java.sql.Date;


import lombok.Data;
@Data
public class SupUpload {
	private int supNum;
	private int supupNum;
	private String supupTitle;
	private String supupContent;
	private String localNum;
	private String supupsubTitle;
	private Date supupDate;
	private String supupStatus;
	private int infoupNum;
	private int themaNum;
}
