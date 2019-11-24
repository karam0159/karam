package com.neating.board.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.board.dao.BoardDAO;
import com.neating.board.vo.BoardVO;

@Service
public class BoardInsertService {
	@Autowired
	private BoardDAO boardDAO;
	
	public int BoardInsert(BoardVO boardVO) throws Exception
	{
		int count = boardDAO.BoardInsert(boardVO);
		return count;
	}
}
