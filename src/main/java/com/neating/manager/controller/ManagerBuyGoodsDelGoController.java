package com.neating.manager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.manager.svc.ManagerBuyGoodsDelGoService;

@Controller
public class ManagerBuyGoodsDelGoController {
	@Autowired
	private ManagerBuyGoodsDelGoService managerBuyGoodsDelGoService;
	@RequestMapping(value="managerFolder/ManagerBuyGoodsDelGo.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("buy_index") int buy_index,
								@RequestParam("page") int page, 
								@RequestParam("goods_lastprice") int goods_lastprice,HttpServletRequest request) throws Exception
	{
		int count = managerBuyGoodsDelGoService.ManagerBuyGoodsDelGo(buy_index);
		if(count > 0)
		{
			System.out.println("배송시작");
		}
		else
		{
			System.out.println("배송실패");
		}
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("buy_index",buy_index);
		mnv.addObject("page",page);
		mnv.addObject("goods_lastprice",goods_lastprice);
		mnv.addObject("member_id","All");
		mnv.setViewName("redirect:BuyGoodsList.do");
		
		return mnv;
		
	}
}
