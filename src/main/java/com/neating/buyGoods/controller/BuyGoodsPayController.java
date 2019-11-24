package com.neating.buyGoods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.buyGoods.svc.BuyGoodsPayService;
import com.neating.member.svc.MemberLoginService;
import com.neating.member.vo.MemberVO;

@Controller
public class BuyGoodsPayController {
	@Autowired
	private BuyGoodsPayService buyGoodsPayService;
	@Autowired
	private MemberLoginService memberLoginService;
	@RequestMapping(value="BuyGoodsPay.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("buy_index") int buy_index,
								@RequestParam("page") int page,	@RequestParam("goods_lastprice") int goods_lastprice,
								@RequestParam("member_id") String member_id, HttpServletRequest request) throws Exception
	{
		int count = buyGoodsPayService.BuyGoodsPay(buy_index,member_id,goods_lastprice);
		
		MemberVO memberVO = memberLoginService.MemberLoginUpdate(member_id);
		
		if(count == 3)
		{
			System.out.println("입금성공");
		}
		else
		{
			System.out.println("입금실패");
		}
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("buy_index",buy_index);
		mnv.addObject("page",page);
		mnv.addObject("member_id",member_id);
		HttpSession session = request.getSession();
		session.setAttribute("memberVO", memberVO);
		mnv.setViewName("redirect:BuyGoodsList.do");
		
		return mnv;
		
	}
}
