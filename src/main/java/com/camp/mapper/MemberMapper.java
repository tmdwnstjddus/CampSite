package com.camp.mapper;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Mapper;

import com.camp.vo.Buy;
import com.camp.vo.Member;
import com.camp.vo.Product;
import com.camp.vo.QnA;
import com.camp.vo.Rental;

@Mapper
public interface MemberMapper {

	void registerMember(Member member);

	Member idCheck(String memberId);
	 
	Member loginMember(HashMap<String, Object> params);
	   
	String idfind(HttpServletResponse response, String email) throws Exception;
	
	Member getMemberById(String memberId);
	 
	void updateMember(Member member);

	List<Member> getList(); 

	List<Rental> reporting();
	
	List<Buy> reportings();

	List<Rental> orderList(String memberId);

	List<Buy> orderLists(String memberId);

	List<QnA> qaList();

	void deleteMember(String memberId);

	void findpwd(Member member);
}
