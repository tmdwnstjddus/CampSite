package com.camp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camp.common.Util;
import com.camp.service.CampService;
import com.camp.service.MemberService;
import com.camp.service.ProductService;
import com.camp.service.QnAService;
import com.camp.vo.Buy;
import com.camp.vo.Member;
import com.camp.vo.QnA;
import com.camp.vo.Rental;

@Controller
@RequestMapping(path = "/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	CampService campService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	QnAService qnaService;	
	
   @RequestMapping(path = "/mypage", method = RequestMethod.GET)
   public String mypage() {
      
      return "member/mypage";
   }
   
	@RequestMapping(path = "/memberset", method = RequestMethod.GET)
	public String memberSetForm(@RequestParam(name="memberId") String memberId, Model model) {
		Member member = memberService.getMemberById(memberId);
		model.addAttribute("member",member);
		return "member/memberset";
	}
	
	
	@RequestMapping(path = "/memberset", method = RequestMethod.POST)
	public String memberSet(HttpServletRequest req, Member member) {
		
		String memberId = req.getParameter("memberId");
		String pwd = req.getParameter("pwd");
		String confirm = req.getParameter("confirm");
		
		if (!pwd.equals(confirm)) {
			return "redirect:/member/memberset?memberId="+memberId;
		}	
//		pwd = Util.getHashedString(pwd, "SHA-256");
		
		member.setMemberId(memberId);
		member.setPwd(pwd);
		memberService.updateMember(member);
		
		return "redirect:/member/mypage?memberId="+memberId;
	}
	/////////////////////////////////////////////회원 탈퇴///////////////////////////////////////////////////////
	
	@RequestMapping(path = "/delete", method = RequestMethod.GET)
	public String delete (HttpSession session) {  

		Member loginuser = (Member) session.getAttribute("loginuser");
		String memberId = loginuser.getMemberId();

		memberService.deleteMember(memberId);
		
		session.removeAttribute("loginuser");

		return "redirect:/";		
	}
	

	
/////////////////////////////////////////////주문 내역///////////////////////////////////////////////////////
	   @RequestMapping(path = "/orderlist", method = RequestMethod.GET)
	   public String orderList(Model model, String memberId) { 

		List<Rental> rents = memberService.orderList(memberId);
		
		List<Buy> buys = memberService.orderLists(memberId);
		
		for (Rental rent : rents) {
			rent.setFile(campService.findCampFile(rent.getCampNo()));
		}

		for (Buy buy : buys) {
			buy.setFile(productService.findProductFile(buy.getProductNo()));
		}		
		   
		model.addAttribute("rents", rents);
		model.addAttribute("buys", buys);		
		   
	      return "member/orderlist";
	   } 
	   
/////////////////////////////////////////////관리자 페이지///////////////////////////////////////////////////////
	   @RequestMapping(path = "/adminpage", method = RequestMethod.GET)
	   public String adminPage() {
	      
		   
		   
	      return "member/adminpage";
	   }
	   
	   //회원리스트
		@RequestMapping(path = "/memberlist", method = RequestMethod.GET)
		public String memberList(Model model) {
			
			List<Member> members = memberService.findMemberList();
			
			model.addAttribute("members", members);
			return "member/memberlist";
		}
		
		//질문리스트
		@RequestMapping(path = "/qalist", method = RequestMethod.GET)
		public String qaList(Model model) {
				
		    List<QnA> announce = qnaService.findAnnounce();
		    
		      model.addAttribute("announce",announce);
			return "member/qalist";
		}		 
			
		//캠핑장 및 캠핑용품 별 레포팅
		@RequestMapping(path = "/reporting", method = RequestMethod.GET)
		public String ReportingForm(Model model) {
			
			List<Rental> report = memberService.reporting();
			List<Buy> reports = memberService.reportings();
			
		    model.addAttribute("reports", report);
		    model.addAttribute("reportss", reports);
				
			return "member/reporting";
		}	
		
		@RequestMapping(path = "/rent_cancle", method = RequestMethod.GET)
		public String rent_cancle(Model model, HttpSession session, Rental rent) {
			
			Member loginuser = (Member) session.getAttribute("loginuser");
			
			memberService.cancleRent(rent);
			model.addAttribute("loginuser", loginuser);
		
			return "redirect:/member/orderlist";
		}
}