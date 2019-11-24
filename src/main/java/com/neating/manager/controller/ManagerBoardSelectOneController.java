package com.neating.manager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.board.vo.BoardVO;
import com.neating.manager.svc.ManagerBoardSelectOneService;

@Controller
public class ManagerBoardSelectOneController {
	@Autowired
	private ManagerBoardSelectOneService managerBoardSelectOneService;
	
	@RequestMapping(value="managerFolder/Board_SelectOne.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("board_index") int board_index, HttpServletRequest request) throws Exception
	{
		BoardVO boardVO = managerBoardSelectOneService.ManagerBoardSelectOne(board_index);
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("boardVO", boardVO);
		mnv.setViewName("Manager_index.jsp?page=boardManage/Manager_BoardSelectOne.jsp");
	
		return mnv;
	}
}
