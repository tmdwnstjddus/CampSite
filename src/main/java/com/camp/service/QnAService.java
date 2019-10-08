package com.camp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.camp.vo.QnA;
import com.camp.vo.QnAComment;
import com.google.gson.JsonObject;

public interface QnAService {

	List<QnA> findAllQnA();
	List<QnA> findAnnounce();

	void uploadQnA(QnA qna);

	void deleteQna(int qaNo);

	QnA findQnABoardbyIdx(int qaNo);
	
	

	/* ===================================*/
	


	List<QnAComment> findQnAAnswer(int qaNo);
	
	

	/* ========== for Admin */
	List<QnA> findAllforAdmin();
	List<QnAComment> findQnAAnswerforAdmin();
	
	void writeComment(QnAComment qnaComment);
	void deleteAnswer(int commentVal);
	void updateAnnounce(QnA qna);

	

	



	

}
