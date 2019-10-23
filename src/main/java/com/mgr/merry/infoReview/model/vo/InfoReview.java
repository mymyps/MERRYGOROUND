package com.mgr.merry.infoReview.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class InfoReview {
	private int infoReviewNum;
	private int infoupNum;
	private String infoReviewContent;
	private int infoReviewPoint;
	private Date infoReviewDate;
	private String infoReviewStatus;
}
