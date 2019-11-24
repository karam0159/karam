package com.neating.buyGoods.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.buyGoods.svc.BuyGoodsUpdateService;
import com.neating.buyGoods.vo.BuyGoodsVO;

@Controller
public class BuyGoodsUpdateController {
	@Autowired
	private BuyGoodsUpdateService buyGoodsUpdateService;
	
	@RequestMapping(value="BuyGoodsUpdate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(BuyGoodsVO buyGoodsVO, @RequestParam("buy_index") int buy_index, HttpServletRequest request) throws Exception
	{
		int count = buyGoodsUpdateService.BuyGoodsUpdate(buyGoodsVO);
		
		if(count > 0)
		{
			System.out.println("성공");
		}
		else if(count == 0)
		{
			System.out.println("업뎃실패");
		}
		else
		{
			System.out.println("업뎃할것없음");
		}
		
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("redirect:BuyGoodsSelectOne.do?buy_index="+buy_index);
		return mnv;
	}
}
