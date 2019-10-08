package com.camp.vo;



import java.util.ArrayList;
import java.util.Date;

import lombok.Data;

@Data
public class Buy {
   
   private int buyNo;
   private int amount;
   private String addr1; 
   private String addr2;
   private String addr3; 
   private Date buyDate;
   private String memberId;
   private int productNo;
   private int price;
   private String productName;
   private boolean flag;   
   private int sell;
   private int money;
   
   private ProductFile file;  // flag = 1
   private ArrayList<ProductFile> fileList; // flag = 0

   
}