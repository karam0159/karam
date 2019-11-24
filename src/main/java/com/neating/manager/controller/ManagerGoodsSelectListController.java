package com.neating.manager.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.goods.vo.GoodsVO;
import com.neating.manager.svc.ManagerGoodsSelectListService;

@Controller
public class ManagerGoodsSelectListController {
	@Autowired
	private ManagerGoodsSelectListService goodsSelectListService;
	
	@RequestMapping(value="managerFolder/Manager_GoodsSelectList.do", method= {RequestMethod.GET, RequestMethod.POST})
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
		mnv.addObject("goodsList",goodsList);
		mnv.setViewName("Manager_index.jsp?page=goodsManage/Manager_GoodsManage.jsp");
		
		return mnv;
	}
}
