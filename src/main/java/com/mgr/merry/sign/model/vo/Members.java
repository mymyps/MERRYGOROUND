package com.mgr.merry.sign.model.vo;

import java.sql.Date;


import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor 
@Data
public class Members {
	private int memberNum;
	private String id;
	private String pw;
	private String memberName;
	private String birth;
	private char gender;
	private String phone;
	private String email;
	private Date enrolldate;
	private int mlevel;
	private String proimg;
	private char cpstatus;
	private String cpid;
}
