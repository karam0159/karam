package com.neating.manager.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;

@Service
public class ManagerGoodsDeleteService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public int ManagerGoodsDelete(int goods_index) throws Exception
	{
		int count = goodsDAO.GoodsDelete(goods_index);
		
		return count;
	}
}
