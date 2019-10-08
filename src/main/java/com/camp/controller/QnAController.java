package com.camp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camp.service.QnAService;
import com.camp.vo.QnA;
import com.camp.vo.QnAComment;

@Controller
@RequestMapping(path = "/qna")
public class QnAController {
	
	@Autowired
	QnAService qnaService;

	@RequestMapping(path = "/qna", method = RequestMethod.GET)
	public String qnaList(Model model) {
		
		List<QnA> qnaList = qnaService.findAllQnA();
		
		model.addAttribute("qnaList", qnaList);
		
		return "qna/qna";
	}
	
	@RequestMapping(path = "/qnawrite", method = RequestMethod.GET)
	public String qnaWriteForm() {
		
		return "qna/qnawrite";
	}
	@RequestMapping(path = "/qnawrite", method = RequestMethod.POST)
	public String qnaWrite(QnA qna,HttpServletRequest req ) {
		
		qnaService.uploadQnA(qna);
		
		return "redirect:/member/qalist";
	}
	
	@RequestMapping(path = "/qnadetail", method = RequestMethod.GET)
	public String qnaDetailPage(int qaNo, Model model) {
		
		QnA qna = qnaService.findQnABoardbyIdx(qaNo);
		if (qna == null) {
			return "redirect:/qna/qna";
		}

		model.addAttribute("qna",qna);
		
		List<QnAComment> qnacomments = qnaService.findQnAAnswer(qaNo);
		model.addAttribute("qnacomments", qnacomments);
		
		return "qna/qnadetail";
	}
	
	//게시물 삭제 - user
	@RequestMapping(path="/deletedqna/{qaNo}", method = RequestMethod.GET)
	public String qnaDelete(@PathVariable int qaNo) {
		qnaService.deleteQna(qaNo);
		
		return "redirect:/qna/qna";
	}
	
//-----------------------------------------------//
	
	//답변 불러오는 
	@RequestMapping(value = "/qna-answer", method = RequestMethod.GET)
	public String QnAAnswer(int qaNo, Model model) {
		
		List<QnAComment> qnacomments = qnaService.findQnAAnswer(qaNo);
		model.addAttribute("qnacomments", qnacomments);
		
		return "qna/qnacomment";

	}

	
//qna/Admin-----------------------------------------------//
	
	@RequestMapping(path = "/admin", method = RequestMethod.GET)
	public String qnaAdmin(Model model) {
		
		List<QnA> announce = qnaService.findAnnounce();
		model.addAttribute("announce",announce);
		
		return "qna/admin";
	}
	
	@RequestMapping(
			value="/getQuestionList",
			method=RequestMethod.GET,
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> getQnAList(){
		
		List<QnA> QnAs = qnaService.findAllforAdmin();
		//List<QnAComment> Comments = qnaService.findQnAAnswerforAdmin();
		
		for (QnA qna : QnAs) {
			int qaNo = qna.getQaNo();
			List<QnAComment> comments = qnaService.findQnAAnswer(qaNo);
			qna.setQnaCommentList(comments);
		}
		
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("questions", QnAs);
		
		
		return resultMap;
	}
	
	//------admin answer
	@RequestMapping(
			value="/admin-answer",
			method=RequestMethod.POST,
			produces="text/plain;charset=utf-8")
	@ResponseBody
	public String answerQuestion (int qaNo, String answerText){
		
		QnAComment qnaComment = new QnAComment();
		
		qnaComment.setQaNo(qaNo);
		qnaComment.setComment(answerText);
		
//		System.out.printf("%d - %s", qaNo, answerText);

		
		qnaService.writeComment(qnaComment);

		return "success";
		
	}
	
	@RequestMapping(path = "/delete-answer", method = RequestMethod.GET)
	@ResponseBody
	public String deleteAnswer(int qaNo) {
		
		int commentVal = qaNo;
		
		qnaService.deleteAnswer(commentVal);
		
		return "success";
	}
	
	
	
	
	
	//announce ----------------------------//
	
	@RequestMapping(path = "/announce", method = RequestMethod.GET)
	public String announceList(Model model) {
		
		List<QnA> announce = qnaService.findAnnounce();
		
		model.addAttribute("announce",announce);
		
		return "qna/announce";
	}
	
	@RequestMapping(path = "/announce-update", method = RequestMethod.GET)
	public String announceUpdatePage(int qaNo, Model model) {
		
		QnA qna = qnaService.findQnABoardbyIdx(qaNo);
		if (qna == null) {
			return "redirect:/qna/qna";
		}

		model.addAttribute("qna",qna);
		
		return "qna/announceupdate";

	}
	
	@RequestMapping(path = "/announce-update", method = RequestMethod.POST)
	public String announceUpdate(HttpServletRequest req, QnA qna) {
		
		qnaService.updateAnnounce(qna);
		
		return "redirect:announce";

	}
	
	
	@RequestMapping(path = "/announce-detail", method = RequestMethod.GET)
	public String announceDetailPage(int qaNo, Model model) {
		
		QnA announce = qnaService.findQnABoardbyIdx(qaNo);
		if (announce == null) {
			return "redirect:/qna/qna";
		}
		model.addAttribute("announce",announce);

		
		return "qna/announcedetail";
	}
	
	
	@RequestMapping(path="/announce-delete/{qaNo}", method = RequestMethod.GET)
	public String announceDelete(@PathVariable int qaNo) {
		
		qnaService.deleteQna(qaNo);
		
		return "redirect:/qna/qna";
	}
	
	
	

}
