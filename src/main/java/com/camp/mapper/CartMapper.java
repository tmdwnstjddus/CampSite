package com.camp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.camp.vo.Buy;
import com.camp.vo.Cart;

@Mapper
public interface CartMapper {

	void insertCart(Cart cart);
	void updateCart(Cart cart);
	List<Cart> selectCartsByMemberId(String memberId);
	int sumMoney(String memberId);
	int selectMap(Map<String, Object> map);
	void modifyCart(Cart cart);
	void deleteCart(int cartNo);
	
	void buyCartDetail(Buy buy);
	void allDelete(String memberId);

	
		
}
