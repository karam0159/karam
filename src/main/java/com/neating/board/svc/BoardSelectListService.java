package com.neating.board.svc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.board.dao.BoardDAO;
import com.neating.board.vo.BoardVO;

@Service
public class BoardSelectListService {
	@Autowired
	private BoardDAO boardDAO;
	
	public HashMap<Object, Object> BoardSelectList(int page, String board_class) throws Exception
	{
		List<BoardVO> boardVO = boardDAO.BoardAllSelectList(board_class);
		int boardAllCount = boardVO.size();
		
		int limit = 20;				
		// 한페이지에 보여줄 양(8)	
		Integer startPage = 1;
		
		if(page > 9)
		{
			startPage = (int) (page/10)*10;
		}	
		System.out.println("startPage="+startPage);
//		Integer startPage = (section*10)-9;		
//		System.out.println("startPage="+startPage);
		// 시작페이지 그게 1일수도 11일수도 21일수도
		int endPage = (int)((boardAllCount-1)/limit)+1;			
		// 종료페이지 5일수도 9일수도 14일수도
		
		List<BoardVO> boardVOList =  boardDAO.BoardSelectList(page, limit, board_class);
		
		HashMap<Object, Object> boardListData = new HashMap<Object, Object>();
		boardListData.put("startPage", startPage);
		boardListData.put("endPage", endPage);
		boardListData.put("boardVOList", boardVOList);
		
		return boardListData;
	}
}
