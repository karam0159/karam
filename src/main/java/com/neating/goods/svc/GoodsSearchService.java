package com.neating.goods.svc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;
import com.neating.goods.vo.GoodsVO;

@Service
public class GoodsSearchService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public HashMap<Object, Object> GoodsSearch(String goods_name,int page) throws Exception
	{
		int count = goodsDAO.GoodsSearchAllCount(goods_name);
		
		int limit = 10;
		Integer startPage = 0;
		if(page < 10)
		{
			startPage = 1;
		}
		else
		{
			startPage = (page/10)*10;
		}
		
		int endPage = ((count-1)/limit)+1;
		
		List<GoodsVO> goodsVO = goodsDAO.GoodsSearch(goods_name, page, limit);
		
		HashMap<Object, Object> data = new HashMap<Object, Object>();
		data.put("startPage", startPage);
		data.put("endPage", endPage);
		data.put("goodsVO", goodsVO);
		
		return data;
	}
}
