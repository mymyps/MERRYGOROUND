package com.mgr.merry.sign.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Members {
	private int memberNum;
	private String id;
	private String pw;
	private String name;
	private String birth;
	private char gender;
	private String phone;
	private String email;
	private Date enrolldate;
	private int memberLevel;
	private int status;
	private String proimg;
	private char cpstatus;
	private String cpid;
	private char emailcertify;
	private String code;
	private String supstatus;
}
