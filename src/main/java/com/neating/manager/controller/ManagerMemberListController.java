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

import com.neating.manager.svc.ManagerMemberListService;
import com.neating.member.vo.MemberVO;

@Controller
public class ManagerMemberListController {
	@Autowired
	private ManagerMemberListService managerMemberListService;
	@RequestMapping(value="managerFolder/Manager_Member_Manage.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("page") int page,	HttpServletRequest request) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		
		HashMap<Object,Object> memberSelectListData = managerMemberListService.ManagerMemberList(page);
		int startPage = (int) memberSelectListData.get("startPage");
		int endPage = (int) memberSelectListData.get("endPage");
		List<MemberVO> memberSelectList = (List<MemberVO>) memberSelectListData.get("memberSelectList");
		
		mnv.addObject("page", page);
		mnv.addObject("startPage", startPage);
		mnv.addObject("endPage", endPage);
		mnv.addObject("memberSelectList", memberSelectList);
		mnv.setViewName("Manager_index.jsp?page=memberManage/Manager_MemberManage.jsp");
		return mnv;
	}
}
