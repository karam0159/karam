package com.neating.manager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.manager.svc.ManagerMemberPointService;

@Controller
public class ManagerMemberPointController {
	@Autowired
	private ManagerMemberPointService managerMemberPointService;
	@RequestMapping(value="managerFolder/ManagerMemberPoint.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_id") String member_id,
								HttpServletRequest request) throws Exception
	{
		int count = managerMemberPointService.ManagerMemberPoint(member_id);
		if(count > 0)
		{
			System.out.println("성공");
		}
		else
		{
			System.out.println("실패");
		}
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("member_id",member_id);
		mnv.setViewName("redirect:Manager_Member_Select.do");
		return mnv;
	}
}
