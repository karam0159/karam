package com.neating.buyGoods.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.buyGoods.svc.BuyGoodsSelectOneService;
import com.neating.buyGoods.vo.BuyGoodsVO;

@Controller
public class BuyGoodsSelectOneController {
	@Autowired
	private BuyGoodsSelectOneService buyGoodsSelectOneService;
	@RequestMapping(value="BuyGoodsSelectOne.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("buy_index") int buy_index,HttpServletRequest request) throws Exception
	{
		BuyGoodsVO buyGoodsVO = buyGoodsSelectOneService.BuyGoodsSelectOne(buy_index);
		ModelAndView mnv = new ModelAndView();
		
		mnv.addObject("buyGoodsVO",buyGoodsVO);
		mnv.setViewName("index.jsp?page=member/Member_BuyViewPage.jsp");

		return mnv;
	
	}
	
}
