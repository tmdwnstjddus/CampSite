package com.camp.vo;


import java.util.Date;
import java.util.ArrayList;

import lombok.Data;

@Data
public class Rental {
	
	private int rentNo;
	private Date startDate;
	private Date endDate;
	private int campNo;	
	private String memberId;

	private String category;
	private String campName;
	private int price;
	private int reserve;
	private boolean flag;

	private CampFile file;  // flag = 1
	private ArrayList<CampFile> fileList; // flag = 0
}