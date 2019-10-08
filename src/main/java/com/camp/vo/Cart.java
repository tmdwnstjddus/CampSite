package com.camp.vo;


import java.util.ArrayList;

import lombok.Data;

@Data
public class Cart {
	
	private int cartNo;
	private int amount;
	private int productNo;
	private String memberId;
	private String savedFileName;
	
	
	private String name;
	private int money;
	private int price;
	private String productName;
	private String category;
	
	private ProductFile file;  // flag = 1
	private ArrayList<ProductFile> fileList; // flag = 0
	
	
}