package com.camp.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Camp {	
	
	private int campNo;
	private String campName;
	private String content;
	private int price;
	private String category;
	private String memberId;
	
	private CampFile file;  // flag = 1
	private ArrayList<CampFile> fileList; // flag = 0
	
}
