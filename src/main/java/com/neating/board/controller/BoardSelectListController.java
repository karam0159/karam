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

import com.neating.board.svc.BoardSelectListService;
import com.neating.board.vo.BoardVO;

@Controller
public class BoardSelectListController {
	@Autowired
	private BoardSelectListService boardSelectListService;
	@RequestMapping(value="Board_SelectList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("board_class") String board_class,
								@RequestParam("page") int page, HttpServletRequest request) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		
		HashMap<Object, Object> boardListData = boardSelectListService.BoardSelectList(page, board_class);
		
		int startPage = (int) boardListData.get("startPage");
		int endPage = (int) boardListData.get("endPage");
		List<BoardVO> boardList = (List<BoardVO>) boardListData.get("boardVOList");
		
		mnv.addObject("startPage", startPage);
		mnv.addObject("endPage", endPage);
		mnv.addObject("page", page);
		mnv.addObject("board_class", board_class);
		mnv.addObject("boardList", boardList);
		mnv.setViewName("index.jsp?page=board/Board_List.jsp");
		
		return mnv;
	}
}
