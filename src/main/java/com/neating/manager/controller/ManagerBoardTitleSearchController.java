package com.neating.manager.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.board.vo.BoardVO;
import com.neating.manager.svc.ManagerBoardTitleSearchService;

@Controller
public class ManagerBoardTitleSearchController {
	@Autowired
	private ManagerBoardTitleSearchService mangerBoardTitleSearchService;
	@RequestMapping(value="managerFolder/BoardTitleSearch.do" , method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam(value="board_title", required=false, defaultValue="") String board_title,
								@RequestParam("page") int page,HttpServletRequest request) throws Exception
	{
		HashMap<Object , Object> boardVOdata = mangerBoardTitleSearchService.ManagerBoardTitleSearch(board_title, page);
		int startPage = (int) boardVOdata.get("startPage");
		int endPage = (int) boardVOdata.get("endPage");
		List<BoardVO> boardList = (List<BoardVO>) boardVOdata.get("boardVO");
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("board_title", board_title);
		mnv.addObject("page", page);
		mnv.addObject("startPage", startPage);
		mnv.addObject("endPage", endPage);
		mnv.addObject("boardList", boardList);
		mnv.addObject("searchPoint", 1);
		mnv.addObject("board_class", "Search");
		
		mnv.setViewName("Manager_index.jsp?page=boardManage/Manager_BoardManage.jsp");
		
		return mnv;
	
	}
}
