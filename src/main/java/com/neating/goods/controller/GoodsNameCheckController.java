package com.neating.goods.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neating.goods.svc.GoodsNameCheckService;

@Controller
public class GoodsNameCheckController {
	@Autowired
	private GoodsNameCheckService goodsNameCheckService;
	
	@RequestMapping(value="managerFolder/GoodsNameCheck.ajax" , method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String execute(@RequestParam("goods_name") String goods_name,
							@RequestParam("goods_class") String goods_class,HttpServletRequest request) throws Exception
	{
		int countX = goodsNameCheckService.GoodsNameCheck(goods_name,goods_class);
		System.out.println("countX="+countX);
		String count = "";
		if(countX == 1)
		{
			count = "1"; // 중복
		}
		else
		{
			count = "0"; // 중복아님
		}
		
		return count;
				
	}
	
	
}
