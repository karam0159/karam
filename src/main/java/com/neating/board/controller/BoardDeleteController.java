package com.neating.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.board.svc.BoardDeleteService;

@Controller
public class BoardDeleteController {
	@Autowired
	private BoardDeleteService boardDeleteService;
	
	@RequestMapping(value="Board_Delete.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("board_index") int board_index, 
								@RequestParam("board_class") String board_class, HttpServletRequest request) throws Exception
	{
		int count = boardDeleteService.BoardDelete(board_index);
		
		if(count > 0)
		{
			System.out.println("삭제성공");
		}
		else
		{
			System.out.println("삭제실패");
		}
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("board_index", board_index);
		mnv.addObject("board_class", board_class);
		mnv.addObject("section", 1);
		mnv.addObject("page", 1);
		mnv.setViewName("redirect:Board_SelectList.do");
		
		return mnv;
	}
}
