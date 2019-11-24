package com.neating.cart.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.cart.svc.CartInsertService;
import com.neating.cart.vo.CartVO;

@Controller
public class CartInsertController {
	@Autowired
	private CartInsertService cartInsertService;
	
	@RequestMapping(value="CartInsert.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("goods_index") int goods_index,
								@RequestParam("member_id") String member_id,HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		
		CartVO cartVO = new CartVO(
    			0,
    			member_id,
    			goods_index,
    			request.getParameter("goods_name"),
    			Integer.parseInt(request.getParameter("goods_price")),
    			request.getParameter("goods_imageTitle"),
    			null
    			);
		int count = cartInsertService.CartInsert(cartVO);	
		if(count > 0)
		{
			System.out.println("성공");
			mnv.setViewName("redirect:GoodsSelectOne.do?page=1&goods_index="+goods_index);
			return mnv;
		}
		else
		{
			System.out.println("실패");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('장바구니가 가득찼습니다(50개)'); location.href='GoodsSelectOne.do?goods_index='+goods_index;</script>");
			return null;
		}
		
	}
}
