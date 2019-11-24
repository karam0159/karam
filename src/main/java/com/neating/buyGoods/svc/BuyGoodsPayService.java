package com.neating.buyGoods.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.buyGoods.dao.BuyGoodsDAO;

@Service
public class BuyGoodsPayService {
	@Autowired
	private BuyGoodsDAO buyGoodsDAO; 
	
	public int BuyGoodsPay(int buy_index,String member_id,int goods_lastprice) throws Exception
	{
		int count = buyGoodsDAO.BuyGoodsPay(buy_index,member_id,goods_lastprice);
		return count;
	}
}

