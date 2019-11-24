package com.neating.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neating.config.SMTP_EmailUtil;


@Controller
public class MemberEmailCheckController {
	@RequestMapping(value="Member_ID_EmailCheck.do", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody			// 값을 view가 아니라 ajax로 보내겠음
	public String execute(@RequestParam("member_email") String email,
						  @RequestParam("member_name") String name,HttpServletRequest request) throws Exception
	{
		String authNum = "";
		
		authNum = SMTP_EmailUtil.RandomNum();
		SMTP_EmailUtil.sendEmail(email.toString(),name.toString(),authNum);

		System.out.println("authNum="+authNum);
		
		return authNum;
	}
}
