package com.neating.manager.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.buyGoods.dao.BuyGoodsDAO;

@Service
public class ManagerBuyGoodsDelGoService {
	@Autowired
	private BuyGoodsDAO buyGoodsDAO;
	
	public int ManagerBuyGoodsDelGo(int buy_index) throws Exception
	{
		int count = buyGoodsDAO.BuyGoodsDelGo(buy_index);
		return count;
	}
}
