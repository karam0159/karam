package com.neating.manager.svc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;
import com.neating.goods.vo.GoodsVO;

@Service
public class ManagerGoodsSearchService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public HashMap<Object, Object> ManagerGoodsSearch(String goods_name, int page) throws Exception
	{
		int goodsCount = goodsDAO.GoodsNameSearchAllSelect(goods_name);
		
		int limit = 20;
		
		List<GoodsVO> goodsVO = goodsDAO.GoodsNameSearchSelect(goods_name,page,limit);
		
		Integer startPage = 1;
		if(page > 9)
		{
			startPage = (page/10)*10;
		}
		int endPage = ((goodsCount-1)/limit)+1;
		
		HashMap<Object, Object> goodsVOdata = new HashMap<Object,Object>();
		goodsVOdata.put("startPage", startPage);
		goodsVOdata.put("endPage", endPage);
		goodsVOdata.put("goodsVO", goodsVO);
		
		return goodsVOdata;
	}
}
