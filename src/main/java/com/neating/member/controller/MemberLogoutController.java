package com.neating.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberLogoutController {
	@RequestMapping(value="/Member_Logout.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String execute(HttpServletRequest request) throws Exception
	{
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/index.do";
	}
}
