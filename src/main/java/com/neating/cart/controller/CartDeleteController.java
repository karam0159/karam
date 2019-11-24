package com.neating.cart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neating.cart.svc.CartDeleteService;

@Controller
public class CartDeleteController {
	@Autowired
	private CartDeleteService cartDeleteService;
	
	@RequestMapping(value="CartDelete.do", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody			// 값을 view가 아니라 ajax로 보내겠음
	public String execute(@RequestParam("cart_index") int cart_index,
						HttpServletRequest request) throws Exception
	{
		int count = cartDeleteService.CartDelete(cart_index);
		String count2 = "0";
		
		if(count > 0)
		{
			System.out.println("성공");
			count2 = "1";
		}
		else
		{
			System.out.println("실패");
			count2 = "0";
		}
		
		return count2;
		
	}
}
