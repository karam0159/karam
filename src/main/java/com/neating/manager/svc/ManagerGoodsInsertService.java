package com.neating.manager.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;
import com.neating.goods.vo.GoodsImageVO;
import com.neating.goods.vo.GoodsVO;

@Service
public class ManagerGoodsInsertService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public int GoodsInsert(GoodsVO goodsVO) throws Exception
	{
		int count = goodsDAO.GoodsInsert(goodsVO);
		
		return count;
	}
	
	public int GoodsImageInsert(GoodsImageVO goodsImageVO) throws Exception
	{
		int count = goodsDAO.GoodsImageInsert(goodsImageVO);
		return count;
	}
	public int GoodsContentInsert(String safeFile) throws Exception
	{
		int count = goodsDAO.GoodsContentImageInsert(safeFile);
		return count;
	}
}
