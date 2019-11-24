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
import com.neating.manager.svc.ManagerGoodsSearchService;

@Controller
public class ManagerGoodsSearchController {
	@Autowired
	private ManagerGoodsSearchService managerGoodsSearchSerivce;
	@RequestMapping(value="managerFolder/ManagerGoodsSearch.do" , method= {RequestMethod.GET, RequestMethod.POST})
	
	public ModelAndView execute(@RequestParam(value="goods_name", required=false, defaultValue="") String goods_name,
								@RequestParam("page") int page,HttpServletRequest request) throws Exception
	{
		HashMap<Object, Object> goodsVOdata = managerGoodsSearchSerivce.ManagerGoodsSearch(goods_name,page);
		int startPage = (int) goodsVOdata.get("startPage");
		int endPage = (int) goodsVOdata.get("endPage");
		List<GoodsVO> goodsList = (List<GoodsVO>) goodsVOdata.get("goodsVO");
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("page",page);
		mnv.addObject("goods_name",goods_name);
		mnv.addObject("startPage",startPage);
		mnv.addObject("endPage",endPage);
		mnv.addObject("goodsList",goodsList);
		mnv.addObject("searchPoint",1);
		mnv.addObject("goods_class","Search");
		
		mnv.setViewName("Manager_index.jsp?page=goodsManage/Manager_GoodsManage.jsp");
		
		return mnv;
	}
	
}
