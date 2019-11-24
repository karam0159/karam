package com.neating.board.svc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.board.dao.BoardDAO;
import com.neating.board.vo.BoardVO;

@Service
public class BoardSearchService {
	@Autowired
	private BoardDAO boardDAO;
	
	public HashMap<Object, Object> BoardSearch(int page, String board_class, String board_title) throws Exception
	{
		int boardCount = boardDAO.BoardTitleClassSearch(board_class, board_title);
		int limit = 20;
		List<BoardVO> boardVO = boardDAO.BoardTitleClassListSearch(page, board_class, board_title, limit);
		Integer startPage = 1;
		if(page > 9)
		{
			startPage = (page/10)*10;
		}
		int endPage = ((boardCount-1)/limit)+1;
		
		HashMap<Object, Object> boardVOdata = new HashMap<Object,Object>();
		boardVOdata.put("startPage", startPage);
		boardVOdata.put("endPage", endPage);
		boardVOdata.put("boardVO", boardVO);
		return boardVOdata;
	}
}
