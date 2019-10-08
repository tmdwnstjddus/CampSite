package com.camp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.mapper.QnAMapper;
import com.camp.vo.QnA;
import com.camp.vo.QnAComment;

@Service
public class QnAServiceImpl implements QnAService {
	
	@Autowired
	private QnAMapper qnaMapper;
	

	@Override
	public void uploadQnA(QnA qna) {
		
		String lock = qna.getLockCheck();
		if (lock == null) {
			qna.setLockCheck("off");
		}
		
		qnaMapper.uploadQnA(qna);
		
	}


	@Override
	public void deleteQna(int qaNo) {
		qnaMapper.deleteQnA(qaNo);
		
	}

	@Override
	public List<QnA> findAllQnA() {
		List<QnA> qnaList = qnaMapper.selectQnA();
		return qnaList;
	}
	
	@Override
	public List<QnA> findAnnounce() {
		List<QnA> announce = qnaMapper.findAnnounce();
		return announce;
	}
	
	@Override
	public QnA findQnABoardbyIdx(int qaNo) {
		
		QnA qna = qnaMapper.selectQnABoardByIdx(qaNo);
		return qna;
	}



	@Override
	public List<QnAComment> findQnAAnswer(int qaNo) {
		List<QnAComment> qnaComment = qnaMapper.selectComment(qaNo);
		return qnaComment;
	}

	@Override
	public void writeComment(QnAComment qnaComment) {
		qnaMapper.insertQnAComment(qnaComment);
		
		int qaNo = (int)qnaComment.getQaNo();
		qnaMapper.setCompleted(qaNo);
		
		//int qnaNo = Integer.parseInt((String)params.get("qnaNo"));
		
	}

	@Override
	public void deleteAnswer(int commentVal) {
		qnaMapper.dropQnAComment(commentVal);
		qnaMapper.setDecompleted(commentVal);
		
	}

	@Override
	public List<QnA> findAllforAdmin() {

		List<QnA> QnAs = qnaMapper.getSearchValue();

		return QnAs;
	}

	@Override
	public List<QnAComment> findQnAAnswerforAdmin() {
		List<QnAComment> Comments = qnaMapper.getComment();
		return Comments;
	}


	@Override
	public void updateAnnounce(QnA qna) {
	
		qnaMapper.updateAnnounce(qna);
		
	}






	


	









}
