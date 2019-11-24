package com.neating.cart.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.cart.dao.CartDAO;

@Service
public class CartDeleteService {
	@Autowired
	private CartDAO cartDAO;
	
	public int CartDelete(int cart_index) throws Exception
	{
		int count = cartDAO.CartDelete(cart_index);
		return count;
	}
}
