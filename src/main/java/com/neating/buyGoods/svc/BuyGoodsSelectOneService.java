package com.neating.buyGoods.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.buyGoods.dao.BuyGoodsDAO;
import com.neating.buyGoods.vo.BuyGoodsVO;

@Service
public class BuyGoodsSelectOneService {
	@Autowired
	private BuyGoodsDAO buyGoodsDAO;
	
	public BuyGoodsVO BuyGoodsSelectOne(int buy_index) throws Exception
	{
		BuyGoodsVO buyGoodsVO = buyGoodsDAO.BuyGoodsSelectOne(buy_index);
		
		return buyGoodsVO;
	}
}
