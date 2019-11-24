package com.neating.goods.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;

@Service
public class GoodsNameCheckService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public int GoodsNameCheck(String goods_name, String goods_class) throws Exception
	{
		int count = goodsDAO.GoodsNameCheck(goods_name, goods_class);
		return count;
	}
}
