package com.neating.goods.svc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.goods.dao.GoodsDAO;
import com.neating.goods.vo.GoodsVO;

@Service
public class GoodsSelectListService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public HashMap<Object,Object> GoodsSelectList(int page, String goods_class,String goods_kind) throws Exception
	{
		List<GoodsVO> GoodsAllList = goodsDAO.GoodsAllSelect(goods_class,goods_kind);
		
		int goodsAllCount = GoodsAllList.size();
		System.out.println("allcount="+goodsAllCount);
		// 총 상품 량(45)
		int limit = 8;				
		// 한페이지에 보여줄 양(8)	
		Integer startPage = 1;
		
		if(page > 9)
		{
			startPage = (int) (page/10)*10;
		}		
		// 시작페이지 그게 1일수도 11일수도 21일수도
		int endPage = (int)((goodsAllCount-1)/limit)+1;			
		// 종료페이지 5일수도 9일수도 14일수도
		
		List<GoodsVO> goodsSelectList = goodsDAO.GoodsSelectList(limit, page,goods_class,goods_kind);
		
		HashMap<Object,Object> goodsSelectListData = new HashMap<Object, Object>();
		
		goodsSelectListData.put("startPage",startPage);
		goodsSelectListData.put("endPage",endPage);
		goodsSelectListData.put("goodsSelectList",goodsSelectList);
		
		return goodsSelectListData;
	}
}
