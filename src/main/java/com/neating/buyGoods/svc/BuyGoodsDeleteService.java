package com.neating.buyGoods.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.buyGoods.dao.BuyGoodsDAO;

@Service
public class BuyGoodsDeleteService {
	@Autowired
	private BuyGoodsDAO buyGoodsDAO;
	
	public int BuyGoodsDelete(int buy_index, int member_usesitemoney,String member_id) throws Exception
	{
		int count = buyGoodsDAO.BuyGoodsDelete(buy_index, member_usesitemoney, member_id);
		return count;
	}
}
