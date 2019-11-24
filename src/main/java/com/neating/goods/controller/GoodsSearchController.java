package com.neating.goods.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.goods.svc.GoodsSearchService;
import com.neating.goods.vo.GoodsVO;

@Controller
public class GoodsSearchController {
	@Autowired
	private GoodsSearchService goodsSearchService;
	
	@RequestMapping(value="GoodsSearch.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("goods_name") String goods_name,
								@RequestParam("page") int page,HttpServletRequest request) throws Exception
	{
		HashMap<Object, Object> data = goodsSearchService.GoodsSearch(goods_name,page);
		
		int startPage = (int) data.get("startPage");
		int endPage = (int) data.get("endPage");
		List<GoodsVO> goodsVO = (List<GoodsVO>) data.get("goodsVO");
		
		ModelAndView mnv = new ModelAndView();
		
		mnv.addObject("goods_name",goods_name);
		mnv.addObject("page",page);
		mnv.addObject("startPage",startPage);
		mnv.addObject("endPage",endPage);
		mnv.addObject("goodsVO",goodsVO);
		mnv.setViewName("index.jsp?page=goods/Goods_SearchList.jsp");
		
		return mnv;
	}
}
