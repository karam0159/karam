package com.neating.board.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.board.dao.BoardDAO;
import com.neating.board.vo.BoardVO;

@Service
public class BoardSelectOneService {
	@Autowired
	private BoardDAO boardDAO;
	
	public BoardVO BoardSelectOne(int board_index) throws Exception
	{
		BoardVO boardVO = boardDAO.BoardSelectOne(board_index);
		
		return boardVO;
	}
}
