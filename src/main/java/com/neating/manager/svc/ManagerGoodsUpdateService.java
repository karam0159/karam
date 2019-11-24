package com.neating.manager.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;
import com.neating.goods.vo.GoodsImageVO;
import com.neating.goods.vo.GoodsVO;

@Service
public class ManagerGoodsUpdateService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public int ManagerGoodsUpdate(GoodsVO goodsVO) throws Exception
	{
		int count = goodsDAO.GoodsUpdate(goodsVO);
		return count;
	}
	
	public int GoodsImageUpdate(GoodsImageVO goodsImageVO) throws Exception
	{
		int count = goodsDAO.GoodsImageUpdate(goodsImageVO);
		return count;
	}
	
	public int GoodsContentUpdate(String contentFile,int goods_index) throws Exception
	{
		int count = goodsDAO.GoodsContentImageUpdate(contentFile,goods_index);
		return count;
	}
}
