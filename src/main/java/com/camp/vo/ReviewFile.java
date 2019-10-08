package com.camp.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewFile {

	private int reviewFileNo;	
	private String savedFileName;
	private String userFileName;	
	private boolean flag;	
	private int reviewNo; 
	
	private Date rentDate;
	
}
