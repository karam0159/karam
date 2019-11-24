package com.neating.board.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.board.dao.BoardDAO;
import com.neating.board.vo.BoardVO;

@Service
public class BoardUpdateService {
	@Autowired
	private BoardDAO boardDAO;
	
	public int BoardUpdate(BoardVO boardVO) throws Exception
	{
		int count = boardDAO.BoardUpdate(boardVO);
		return count;
	}
}
