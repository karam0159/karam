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

import com.neating.manager.svc.ManagerMemberSearchService;
import com.neating.member.vo.MemberVO;

@Controller
public class ManagerMemberSearchController {
	@Autowired
	private ManagerMemberSearchService managerMemberSearchService;
	@RequestMapping(value="managerFolder/MemberSearch.do" , method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam(value="member_id", required=false, defaultValue="") String member_id,
								@RequestParam("page") int page,HttpServletRequest request) throws Exception
	{
		HashMap<Object, Object> memberListdata = managerMemberSearchService.ManagerMemberSearch(member_id,page);
		
		int startPage = (int) memberListdata.get("startPage");
		int endPage = (int) memberListdata.get("endPage");
		List<MemberVO> memberSelectList = (List<MemberVO>) memberListdata.get("memberList");
	
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("member_id",member_id);
		mnv.addObject("page",page);
		mnv.addObject("startPage",startPage);
		mnv.addObject("endPage",endPage);
		mnv.addObject("memberSelectList",memberSelectList);
		mnv.addObject("searchPoint",1);
		mnv.setViewName("Manager_index.jsp?page=memberManage/Manager_MemberManage.jsp");
		
		return mnv;
	}
}
