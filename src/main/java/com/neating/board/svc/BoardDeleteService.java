package com.neating.board.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.board.dao.BoardDAO;

@Service
public class BoardDeleteService {
	@Autowired
	private BoardDAO boardDAO;
	
	public int BoardDelete(int board_index) throws Exception
	{
		int count = boardDAO.BoardDelete(board_index);
		
		return count;
	}
}
