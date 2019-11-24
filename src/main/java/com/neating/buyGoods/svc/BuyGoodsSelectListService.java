package com.neating.buyGoods.svc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.buyGoods.dao.BuyGoodsDAO;
import com.neating.buyGoods.vo.BuyGoodsVO;

@Service
public class BuyGoodsSelectListService {
	@Autowired
	private BuyGoodsDAO buyGoodsDAO;
	
	public HashMap<Object, Object> BuyGoodsSelectList(String member_id,  int page) throws Exception
	{
		List<BuyGoodsVO> allList = buyGoodsDAO.BuyGoodsSelectAll(member_id);
		int allCount = allList.size();
		
		// 총 상품 량(45)
		int limit = 5;				
		// 한페이지에 보여줄 양(8)	
		Integer startPage = 1;
		
		if(page > 9)
		{
			startPage = (int) (page/10)*10;
		}	
		// 시작페이지 그게 1일수도 11일수도 21일수도
		int endPage = (int)((allCount-1)/limit)+1;			
		// 종료페이지 5일수도 9일수도 14일수도
		
		List<BuyGoodsVO> selectList = buyGoodsDAO.BuyGoodsSelectList(member_id,page,limit);
		
		HashMap<Object, Object> param = new HashMap<Object,Object>();
		param.put("startPage", startPage);
		param.put("endPage", endPage);
		param.put("selectList", selectList);
		
		return param;
	}
}
