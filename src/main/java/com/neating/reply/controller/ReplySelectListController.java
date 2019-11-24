package com.neating.reply.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.goods.svc.GoodsSelectOneService;
import com.neating.goods.vo.GoodsContentImageVO;
import com.neating.goods.vo.GoodsImageVO;
import com.neating.goods.vo.GoodsVO;
import com.neating.reply.svc.ReplySelectListService;
import com.neating.reply.vo.ReplyVO;

@Controller
public class ReplySelectListController {
	@Autowired
	private ReplySelectListService replySelectListService;
	@Autowired
	private GoodsSelectOneService goodsSelectOneService;
	
	@RequestMapping(value="ReplySelectList.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("goods_index") int goods_index,
								@RequestParam("page") int page,HttpServletRequest request) throws Exception
	{
		HashMap<Object, Object> goodsVOData = goodsSelectOneService.ManagerGoodsSelectOne(goods_index);
		GoodsVO goodsVO = (GoodsVO) goodsVOData.get("goodsVO");
		GoodsImageVO goodsImageVO = (GoodsImageVO) goodsVOData.get("goodsImageVO");
		List<GoodsContentImageVO> goodsContentImageVO = (List<GoodsContentImageVO>) goodsVOData.get("contentImageList");
		
		HashMap<Object, Object> replyVOdata = replySelectListService.ReplySelectList(page,goods_index);
		
		int startPage = (int) replyVOdata.get("startPage");
		int endPage = (int) replyVOdata.get("endPage");
		List<ReplyVO> replyVOList = (List<ReplyVO>) replyVOdata.get("replyVOList");
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("startPage", startPage);
		mnv.addObject("endPage", endPage);
		mnv.addObject("replyVOList", replyVOList);
		mnv.addObject("page", page);
		mnv.addObject("goods_index", goods_index);
		mnv.addObject("reply_key", "yes");
		mnv.addObject("goodsVO", goodsVO);
		mnv.addObject("goodsImageVO", goodsImageVO);
		mnv.addObject("goodsContentImageVO", goodsContentImageVO);
		
		mnv.setViewName("index.jsp?page=goods/Goods_View.jsp");
		
		return mnv;
	}
}
