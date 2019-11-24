package com.neating.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.board.svc.BoardSearchService;
import com.neating.board.vo.BoardVO;

@Controller
public class BoardSearchController {
	@Autowired
	private BoardSearchService boardSearchService;
	@RequestMapping(value="BoardSearch.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("page") int page,
								@RequestParam("board_class") String board_class,
								@RequestParam("board_title") String board_title,HttpServletRequest request) throws Exception
	{
		HashMap<Object, Object> boardVOdata = boardSearchService.BoardSearch(page,board_class,board_title);
		int startPage = (int) boardVOdata.get("startPage");
		int endPage = (int) boardVOdata.get("endPage");
		List<BoardVO> boardList = (List<BoardVO>) boardVOdata.get("boardVO");
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("page",page);
		mnv.addObject("board_class",board_class);
		mnv.addObject("board_title",board_title);
		mnv.addObject("startPage",startPage);
		mnv.addObject("endPage",endPage);
		mnv.addObject("boardList",boardList);
		mnv.addObject("SearchPoint",1);
		mnv.setViewName("index.jsp?page=board/Board_List.jsp");
	
		return mnv;
	}
}
