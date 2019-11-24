package com.neating.goods.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.goods.svc.GoodsBuyPageService;
import com.neating.goods.vo.GoodsVO;

@Controller
public class GoodsBuyPageController {
	@Autowired
	private GoodsBuyPageService goodsBuyPageService;

	@RequestMapping(value="GoodsBuyPage.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("goods_index") int goods_index,
								@RequestParam("goods_countS") int goods_countS, 
								@RequestParam("goods_countM") int goods_countM,
								@RequestParam("goods_countL") int goods_countL,HttpServletRequest request) throws Exception
	{
		GoodsVO goodsVO = goodsBuyPageService.GoodsBuyPage(goods_index);
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("goodsVO",goodsVO);
		mnv.addObject("goods_countS",goods_countS);
		mnv.addObject("goods_countM",goods_countM);
		mnv.addObject("goods_countL",goods_countL);
		mnv.setViewName("index.jsp?page=goods/Goods_BuyPage.jsp");
		
		return mnv;
	}
}
