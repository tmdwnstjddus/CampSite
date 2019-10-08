package com.camp.vo;


import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	
	private String memberId;
	private String pwd;
	private String name;
	private String phone;
	private String type;	
	private String email;	
	private String addr1;
	private String addr2;
	private String addr3;
	private Date regDate;
	
}
