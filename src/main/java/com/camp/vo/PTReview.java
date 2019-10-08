package com.camp.vo;

import java.util.ArrayList;
import java.util.Date;

import lombok.Data;

@Data
public class PTReview {	
	
	private int ptreviewNo;
	private String title;
	private String content;
	private String category;
	private Date regDate;
	private String memberId;
	private int buyNo;
	
	private int productNo;
	
	private PTReviewFile file;  // flag = 1
	private ArrayList<PTReviewFile> fileList; // flag = 0
	
} 
