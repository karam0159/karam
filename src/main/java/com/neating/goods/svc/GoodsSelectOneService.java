package com.neating.goods.svc;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;

@Service
public class GoodsSelectOneService {
	@Autowired
	private GoodsDAO goodsDAO;
	public HashMap<Object, Object> ManagerGoodsSelectOne(int goods_index) throws Exception
	{
		HashMap<Object, Object> param = goodsDAO.GoodsSelectOne(goods_index);
		
		return param;
	}
}
