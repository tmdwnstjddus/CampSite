package com.camp.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class QnA {
	
	private int qaNo;
	private String title;
	private String content;
	private Date regDate;
	private String memberId;
	private Boolean writerType;
	private Boolean deleted;
	private Boolean completed;
	private String lockCheck;
	
	private List<QnAComment> qnaCommentList;
	private QnAComment qnaAComment;

}
