package com.mgr.merry.supLvUpload.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SupLvUpload {
	private int supLvNum;
	private int memberNum;
	private String subLvContent;
	private Date supLvEnrollDate;
}