package com.neating.buyGoods.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.buyGoods.dao.BuyGoodsDAO;
import com.neating.buyGoods.vo.BuyGoodsVO;

@Service
public class BuyGoodsUpdateService {
	@Autowired
	private BuyGoodsDAO buyGoodsDAO;
	
	public int BuyGoodsUpdate(BuyGoodsVO buyGoodsVO) throws Exception
	{
		int count = buyGoodsDAO.BuyGoodsUpdate(buyGoodsVO);
		
		return count;
	}
}
