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

import com.neating.goods.svc.GoodsSelectListService;
import com.neating.goods.vo.GoodsVO;

@Controller
public class GoodsSelectListController {
	@Autowired
	private GoodsSelectListService goodsSelectListService;
	@RequestMapping(value="GoodsSelectList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("page") int page,
								@RequestParam("goods_class") String goods_class,
								@RequestParam("goods_kind") String goods_kind,HttpServletRequest request) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		
		HashMap<Object, Object> goodsSelectListData = goodsSelectListService.GoodsSelectList(page, goods_class,goods_kind);
		
		int startPage = (int) goodsSelectListData.get("startPage");
		int endPage = (int) goodsSelectListData.get("endPage");
		List<GoodsVO> goodsList = (List<GoodsVO>) goodsSelectListData.get("goodsSelectList");
		
		System.out.println("size="+goodsList.size());
		
		mnv.addObject("page",page);
		mnv.addObject("startPage",startPage);
		mnv.addObject("endPage",endPage);
		mnv.addObject("goods_class",goods_class);
		mnv.addObject("goods_kind",goods_kind);
		mnv.addObject("goodsList",goodsList);
		mnv.setViewName("index.jsp?page=goods/Goods_List.jsp");
		
		return mnv;
	}
	
}
