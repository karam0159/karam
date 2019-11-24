package com.neating.goods.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.neating.goods.svc.MainService;
import com.neating.goods.vo.GoodsVO;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	@RequestMapping(value="index.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(HttpServletRequest request) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		
		List<GoodsVO> goodsList = mainService.GoodsSelectListMain();
		
		mnv.addObject("goodsList",goodsList);
		mnv.setViewName("index.jsp");
		
		return mnv;
		
	}
	
}
