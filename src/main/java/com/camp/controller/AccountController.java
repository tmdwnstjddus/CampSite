package com.camp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camp.service.MemberService;
import com.camp.vo.Member;


@Controller
@RequestMapping(path = "/account")
public class AccountController {
	
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(path = "login", method = RequestMethod.GET)
	   public String showLoginForm() {
	      
	      return "account/login"; // /WEB-INF/views/account/login.jsp
	      
	   }
	   
	   @RequestMapping(path = "login", method = RequestMethod.POST)
	   public String login(String memberId, String pwd, HttpSession session) {
	
	      //2. 로그인 가능 여부 확인
	  Member member = memberService.loginMember(memberId, pwd);
	  
	  //3. 로그인 성공 또는 실패 처리
	  if (member != null) { //로그인 가능 -> 로그인 처리 : 세션에 로그인 데이터 저장
	     session.setAttribute("loginuser", member); //로그인 처리
	     return "redirect:/home";          
	  } else { //로그인 실패
	     return "account/login";         
	      }
	      
	   }
	      
	    @RequestMapping(path = "logout", method = RequestMethod.GET) 
	public String logout(HttpSession session) {
	
	session.removeAttribute("loginuser");
	return "redirect:/home";    
	    }
	   
	    
	  // 아이디 찾기 폼
	  @RequestMapping(path = "/idfindform")
	  public String findIdForm() throws Exception{
	     return "/account/idfind";
	  }
	  
	  // 아이디 찾기
	  @RequestMapping(value = "/idfind", method = RequestMethod.POST)
	  public String findId(HttpServletResponse response, @RequestParam("email") String email, Model model) throws Exception{
		 model.addAttribute("memberId", memberService.idfind(response, email));
		 return "/account/idfind2";
	  }
	  
	  // 비밀번호 찾기
	  @RequestMapping(value = "/findpwdform")
	  public String findpwdform() throws Exception{
		return "/account/findpwd";
		}
	  
	  
	  @RequestMapping(value = "/findpwd", method = RequestMethod.POST)
	  public void findpwd(@ModelAttribute Member member, HttpServletResponse response) throws Exception{
			memberService.findpwd(response, member);
			
		} 
	  
	
	//회원가입 폼 이동
	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String registerForm() {
		
		return "account/register";
	}
	
	//회원가입
	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String register(Member member) {
		
		
		memberService.registerMember(member);
		
		return "redirect:/account/login";
		
	}
	
	//ID 체크
	@ResponseBody
	@RequestMapping(path = "/idCheck", method = RequestMethod.POST)
	public int idCheck(HttpServletRequest req) {
		
		String memberId = req.getParameter("memberId");
		Member idCheck = memberService.idCheck(memberId);
		
		int result = 0;
		
		if(idCheck != null) {
			result = 1;
		}
		
		return result;
		
	}
}
