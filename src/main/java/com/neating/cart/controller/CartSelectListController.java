package com.neating.cart.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.cart.svc.CartSelectListService;
import com.neating.cart.vo.CartVO;

@Controller
public class CartSelectListController {
	@Autowired
	private CartSelectListService cartSelectListService;
	
	@RequestMapping(value="CartList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("page") int page, @RequestParam("member_id") String member_id,
								HttpServletRequest request) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
	
		HashMap<Object, Object> param = cartSelectListService.CartSelectList(member_id,page);
		int startPage = (int) param.get("startPage");
		int endPage = (int) param.get("endPage");
		List<CartVO> selectList = (List<CartVO>) param.get("selectList");
		
		mnv.addObject("page",page);
		mnv.addObject("startPage",startPage);
		mnv.addObject("endPage",endPage);
		mnv.addObject("member_id",member_id);
		mnv.addObject("selectList",selectList);
		mnv.setViewName("index.jsp?page=member/Member_CartList.jsp");	
		
		return mnv;
	}
}
