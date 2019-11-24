package com.neating.manager.svc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.board.dao.BoardDAO;
import com.neating.board.vo.BoardVO;

@Service
public class ManagerBoardTitleSearchService {
	@Autowired
	private BoardDAO boardDAO;
	
	public HashMap<Object , Object> ManagerBoardTitleSearch(String board_title, int page) throws Exception
	{
		int limit = 20;
		
		int boardCount = boardDAO.BoardTitleSearchAll(board_title);
		List<BoardVO> boardVO = boardDAO.BoardTitleSearch(board_title, page, limit);
		
		Integer startPage = 1;
		if(page > 9)
		{
			startPage = (page/10)*10;
		}
		int endPage = ((boardCount-1)/limit)+1;
		
		HashMap<Object , Object> boardVOdata = new HashMap<Object, Object>();
		boardVOdata.put("startPage", startPage);
		boardVOdata.put("endPage", endPage);
		boardVOdata.put("boardVO", boardVO);
		return boardVOdata;
	}
}
