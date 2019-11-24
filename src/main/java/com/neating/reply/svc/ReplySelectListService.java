package com.neating.reply.svc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.reply.dao.ReplyDAO;
import com.neating.reply.vo.ReplyVO;

@Service
public class ReplySelectListService {
	@Autowired
	private ReplyDAO replyDAO;
	
	public HashMap<Object, Object> ReplySelectList(int page, int goods_index) throws Exception
	{
		List<ReplyVO> replyVO = replyDAO.ReplyAllSelectList(goods_index);
		int replyAllCount = replyVO.size();
		
		int limit = 20;				
		// 한페이지에 보여줄 양(8)	
		Integer startPage = 1;
		
		if(page > 9)
		{
			startPage = (int) (page/10)*10;
		}	
		// 시작페이지 그게 1일수도 11일수도 21일수도
		int endPage = (int)((replyAllCount-1)/limit)+1;			
		// 종료페이지 5일수도 9일수도 14일수도
		
		List<ReplyVO> replyVOList =  replyDAO.ReplySelectList(page, limit, goods_index);
		
		HashMap<Object, Object> replyVOListData = new HashMap<Object, Object>();
		replyVOListData.put("startPage", startPage);
		replyVOListData.put("endPage", endPage);
		replyVOListData.put("replyVOList", replyVOList);
		
		return replyVOListData;
	}
}
