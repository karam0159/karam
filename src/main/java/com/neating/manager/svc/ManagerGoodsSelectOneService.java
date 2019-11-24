package com.neating.manager.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;
import com.neating.goods.vo.GoodsVO;
import com.neating.manager.dao.ManagerDAO;

@Service
public class ManagerGoodsSelectOneService {
	@Autowired GoodsDAO goodsDAO;
	
	public GoodsVO ManagerGoodsSelectOne(int goods_index) throws Exception
	{
		GoodsVO goodsVO = goodsDAO.GoodsVOSelectOne(goods_index);
		
		return goodsVO;
	}
}
