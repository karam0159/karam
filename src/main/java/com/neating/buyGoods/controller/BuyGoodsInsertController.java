package com.neating.buyGoods.controller;

import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.neating.buyGoods.svc.BuyGoodsInsertService;
import com.neating.buyGoods.vo.BuyGoodsVO;

@Controller
public class BuyGoodsInsertController {
	@Autowired
	private BuyGoodsInsertService buyGoodsInsertService;
	@RequestMapping(value="BuyGoodsInsert.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(HttpServletRequest request) throws Exception
	{
		Timestamp time = new Timestamp(System.currentTimeMillis());
		long time2 = System.currentTimeMillis();
		
		int sec = 240000; 		// 600이 10분 6000이 100분 60000 이 1000분(약 16시간) 240000(약66시간)
		Timestamp original = new Timestamp(time2); 
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(original.getTime());
		cal.add(Calendar.SECOND, sec);
		Timestamp laterTime = new Timestamp(cal.getTime().getTime());
		
		BuyGoodsVO buyGoodsVO = new BuyGoodsVO(
				0,
				request.getParameter("member_id"),
				request.getParameter("member_name"),
				request.getParameter("member_tel"),
				request.getParameter("member_address"),
				request.getParameter("del_name"),
				request.getParameter("del_tel"),
				request.getParameter("del_address"),
				request.getParameter("del_request"),
				"입금대기중",
				Integer.parseInt(request.getParameter("goods_index")),
				request.getParameter("goods_name"),
				request.getParameter("goods_kind"),
				request.getParameter("goods_imageTitle"),
				Integer.parseInt(request.getParameter("goods_countS")),
				Integer.parseInt(request.getParameter("goods_countM")),
				Integer.parseInt(request.getParameter("goods_countL")),
				Integer.parseInt(request.getParameter("goods_price")),
				Integer.parseInt(request.getParameter("member_usesitemoney")),
				Integer.parseInt(request.getParameter("goods_allprice")),
				Integer.parseInt(request.getParameter("del_price")),
				Integer.parseInt(request.getParameter("goods_lastprice")),
				request.getParameter("account_name"),
				request.getParameter("account_bank"),
				request.getParameter("account"),
				null,laterTime
				);
		int count = buyGoodsInsertService.BuyGoodsInsert(buyGoodsVO);
		if(count == 3)
		{
			System.out.println("구입폼성공");
		}
		else
		{
			System.out.println("구입폼실패");
		}
		
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("index.jsp?page=goods/Goods_BuyBefore.jsp");
		mnv.addObject("laterTime",laterTime);
		return mnv;
		
	}
}
