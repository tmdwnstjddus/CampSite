package com.camp.vo;

import java.util.ArrayList;
import lombok.Data;

@Data
public class Product {
	
	private int productNo;
	private String productName;
	private String content;
	private int price;
	private String category;
	private String memberId;
	
	private ProductFile file;  // flag = 1
	private ArrayList<ProductFile> fileList; // flag = 0

}
