package com.neating.manager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.goods.vo.GoodsVO;
import com.neating.manager.svc.ManagerGoodsSelectOneService;

@Controller
public class ManagerGoodsSelectOneController {
	@Autowired 
	private ManagerGoodsSelectOneService managerGoodsSelectOneService;
	
	@RequestMapping(value="managerFolder/Goods_SelectOne.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("goods_index") int goods_index,HttpServletRequest request) throws Exception
	{
		GoodsVO goodsVO = managerGoodsSelectOneService.ManagerGoodsSelectOne(goods_index);
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("goodsVO", goodsVO);
		mnv.setViewName("Manager_index.jsp?page=goodsManage/Manager_GoodsSelectOne.jsp");
		return mnv;
	}
	
}
