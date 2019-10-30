package com.mgr.merry.supporters.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Supporters {

	private int supNum;
	private int memberNum;
	private String supLevel;
	private Date supEnrollDate;
}
