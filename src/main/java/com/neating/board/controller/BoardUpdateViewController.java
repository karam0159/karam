package com.neating.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.board.svc.BoardSelectOneService;
import com.neating.board.vo.BoardVO;

@Controller
public class BoardUpdateViewController {
	@Autowired
	private BoardSelectOneService boardSelectOneService;
	
	@RequestMapping(value="Board_UpdateView.do",method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("board_index") int board_index,
								HttpServletRequest request) throws Exception
	{
		BoardVO boardVO = boardSelectOneService.BoardSelectOne(board_index);
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("boardVO", boardVO);
		mnv.addObject("board_class", boardVO.getBoard_class());
		mnv.setViewName("index.jsp?page=board/Board_Update.jsp");
	
		return mnv;
	}
}
