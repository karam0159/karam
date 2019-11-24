package com.neating.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.member.svc.MemberIdSearchService;


@Controller
public class MemberIdSearchController {
	@Autowired
	private MemberIdSearchService memberIdSearchService;
	
	@RequestMapping(value="Member_IdSearch.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_name") String member_name,
								@RequestParam("member_email") String member_email,HttpServletRequest request) throws Exception
	{
		String member_id = memberIdSearchService.MemberIdSearch(member_name, member_email);
	
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("member_id", member_id);
		mnv.setViewName("index.jsp?page=member/Member_IdSearchView.jsp");
		
		return mnv;
	}
}
