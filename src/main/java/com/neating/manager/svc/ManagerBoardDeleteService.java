package com.neating.manager.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.board.dao.BoardDAO;

@Service
public class ManagerBoardDeleteService {
	@Autowired
	private BoardDAO boardDAO;
	
	public int ManagerBoardDelete(int board_index) throws Exception
	{
		int count = boardDAO.BoardDelete(board_index);
		
		return count;
	}
}
