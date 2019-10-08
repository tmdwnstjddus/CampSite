package com.camp.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.common.Util;
import com.camp.mapper.MemberMapper;
import com.camp.mapper.RentMapper;
import com.camp.vo.Buy;
import com.camp.vo.Camp;
import com.camp.vo.Member;
import com.camp.vo.Product;
import com.camp.vo.QnA;
import com.camp.vo.Rental;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private RentMapper rentMapper;
	
	@Override
	public void registerMember(Member member) {
		
//		String pwd = Util.getHashedString(member.getPwd(), "SHA-256"); //패스워드 암호화 (복원불가능)
//		member.setPwd(pwd);
		
		memberMapper.registerMember(member);
		 
	}

	@Override
	public Member idCheck(String memberId) {
		
		return memberMapper.idCheck(memberId);

	}
	
	   @Override
	   public Member loginMember(String memberId, String pwd) {

//	      pwd = Util.getHashedString(pwd, "SHA-256"); //암호화
	      
	      HashMap<String, Object> params = new HashMap<String, Object>();
	      params.put("memberId", memberId);
	      params.put("pwd", pwd);
	      Member member = memberMapper.loginMember(params);

	      return member;
	   }
	   
		@Override
		public Member getMemberById(String memberId) {
			Member member = memberMapper.getMemberById(memberId);
			return member;
		}
	   
	   // 아이디 찾기
	   @Override
	   public String idfind(HttpServletResponse response, String email) throws Exception {
	      response.setContentType("text/html;charset=utf-8");
	      PrintWriter out = response.getWriter();
	      String memberId = memberMapper.idfind(response, email);
	      
	      if (memberId == null) {
	         out.println("<script>");
	         out.println("alert('가입된 아이디가 없습니다.');");
	         out.println("history.go(-1);");
	         out.println("</script>");
	         out.close();
	         return null;
	      } else {
	         return memberId;
	      }
	 }
	   
		@Override
		public void updateMember(Member member) {
			
			memberMapper.updateMember(member);
		}
		
////////////////////////////////////////관리자 페이지////////////////////////////////////////////		
		
		@Override
		public List<Member> findMemberList() {
			List<Member> members = memberMapper.getList();
			return members;
		}
		
////////////////////////////////////////레포팅 페이지////////////////////////////////////////////			

		@Override
		public List<Rental> reporting() {
			List<Rental> rent = memberMapper.reporting();
			
			return rent;
		}
		
		@Override
		public List<Buy> reportings() {
			List<Buy> buy = memberMapper.reportings();
			return buy;
		}

///////////////////////////////////////주문 내역////////////////////////////////////////////			
		
		@Override
		public List<Rental> orderList(String memberId) {
			
		List<Rental> rent = memberMapper.orderList(memberId);			
			
			return rent;
		}

		@Override
		public List<Buy> orderLists(String memberId) {

			List<Buy> buy = memberMapper.orderLists(memberId);	
			
			return buy;
		}

		@Override
		public List<QnA> qaList() {
			
			List<QnA> qa = memberMapper.qaList();
			
			return qa; 
		}

		@Override
		public void deleteMember(String memberId) {
			
			memberMapper.deleteMember(memberId);
			
	}
		
		// 비밀번호 찾기
		@Override
		public void findpwd(HttpServletResponse response, Member member) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();

				// 임시 비밀번호 생성
				String pwd = "";
				for (int i = 0; i < 9; i++) {
					pwd += (char) ((Math.random() * 26) + 97);
//				    pwd = Util.getHashedString(pwd, "SHA-256");
				}
				member.setPwd(pwd);
				// 비밀번호 변경
				memberMapper.findpwd(member);
				// 비밀번호 변경 메일 발송
				send_mail(member, "findpwd");
				
				out.print("입력하신, 이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
			}
		
		
		// 이메일 발송
		@Override
		public void send_mail(Member member, String div) throws Exception {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "joyechans@naver.com";
			String hostSMTPpwd = "chan71562427";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "joyechans@naver.com";
			String fromName = "TheCamp";
			String subject = "";
			String msg = "";
			
				 if(div.equals("findpwd")) {
				subject = "[더 캠프] 임시 비밀번호 입니다.";
				msg += "<div align='center' style='border:1px solid black; color:black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += member.getMemberId() + "님의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하여 사용하세요.</h3>";
				msg += "<p>임시 비밀번호 : ";
				msg += member.getPwd() + "</p><br></div>";
			}
				
			// 받는 사람 E-Mail 주소
			String mail = member.getEmail();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
		}
	}

		@Override
		public void cancleRent(Rental rent) {
			rentMapper.cancleRent(rent);
			
		}
}
