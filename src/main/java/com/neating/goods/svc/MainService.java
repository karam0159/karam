package com.neating.goods.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;
import com.neating.goods.vo.GoodsVO;

@Service
public class MainService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public List<GoodsVO> GoodsSelectListMain() throws Exception
	{
		List<GoodsVO> goodsList = goodsDAO.GoodsSelectListMain();
		return goodsList;
	}
}
