package com.camp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.mapper.CartMapper;
import com.camp.vo.Buy;
import com.camp.vo.Cart;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;
	

	@Override
	public int countCart(int productNo, String memberId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("memberId", memberId);
		
		return cartMapper.selectMap(map);
	}

	@Override
	public void insertCart(Cart cart) {
		
		cartMapper.insertCart(cart);
		
	}

	@Override
	public void updateCart(Cart cart) {
		
		cartMapper.updateCart(cart);
	}

	@Override
	public List<Cart> findCartListBymemberId(String memberId) {
		
		return cartMapper.selectCartsByMemberId(memberId);
		
	}

	@Override
	public int sumMoney(String memberId) {
		
		
		return cartMapper.sumMoney(memberId);
	}

	@Override
	public void modifyCart(Cart cart) {


		cartMapper.modifyCart(cart);
		
	}

	@Override
	public void deleteCart(int cartNo) {
		
		cartMapper.deleteCart(cartNo);
		
	}

	@Override
	public void buyCartDetail(Buy buy) {
		
		cartMapper.buyCartDetail(buy);
		
	}

	@Override
	public void allDelete(String memberId) {
		
		
		cartMapper.allDelete(memberId);
		
	}

	
	


}

