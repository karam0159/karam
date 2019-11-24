package com.neating.goods.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;
import com.neating.goods.vo.GoodsVO;

@Service
public class GoodsBuyPageService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public GoodsVO GoodsBuyPage(int goods_index) throws Exception
	{
		GoodsVO goodsVO = goodsDAO.GoodsVOSelectOne(goods_index);
		
		return goodsVO;
	}
}
