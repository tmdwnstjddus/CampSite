package com.camp.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.camp.vo.Buy;
import com.camp.vo.Camp;
import com.camp.vo.Member;
import com.camp.vo.Product;
import com.camp.vo.QnA;
import com.camp.vo.Rental;

public interface MemberService {
	
	Member loginMember(String memberId, String pwd);

	String idfind(HttpServletResponse response, String email) throws Exception;

	void registerMember(Member member);

	Member idCheck(String memberId);

	void updateMember(Member member);
 
	Member getMemberById(String memberId);

	List<Member> findMemberList();

	List<Rental> reporting();

	List<Rental> orderList(String memberId);

	List<Buy> orderLists(String memberId);

	List<Buy> reportings();

	List<QnA> qaList();

	void deleteMember(String memberId);

	void send_mail(Member member, String div) throws Exception;

	void findpwd(HttpServletResponse response, Member member) throws Exception;

	void cancleRent(Rental rent);
}
