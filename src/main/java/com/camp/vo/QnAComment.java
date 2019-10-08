package com.camp.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnAComment {
	
	private int commentNo;
	private String comment;
	private Date regDate;
	private int qaNo;

}
