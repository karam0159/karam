package com.neating.buyGoods.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.buyGoods.svc.BuyGoodsDeleteService;

@Controller
public class BuyGoodsDeleteController {
	@Autowired
	private BuyGoodsDeleteService buyGoodsDeleteService;
	
	@RequestMapping(value="BuyGoodsDelete.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_usesitemoney") int member_usesitemoney,
								@RequestParam("buy_index") int buy_index, HttpServletRequest request) throws Exception
	{
		String member_id = "All";
		int count = buyGoodsDeleteService.BuyGoodsDelete(buy_index,member_usesitemoney,member_id);
		if(count != 2)
		{
			System.out.println("삭제 실패");
		}
		else
		{
			System.out.println("삭제 성공");
		}
		ModelAndView mnv = new ModelAndView();
		
		mnv.setViewName("redirect:BuyGoodsList.do?page=1&section=1&member_id="+member_id);
		
		return mnv;
	}
}
