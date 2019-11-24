package com.neating.cart.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.cart.dao.CartDAO;
import com.neating.cart.vo.CartVO;

@Service
public class CartInsertService {
	@Autowired
	private CartDAO cartDAO;
	
	public int CartInsert(CartVO cartVO) throws Exception
	{
		int count = cartDAO.CartInsert(cartVO);
		return count;
	}
}
