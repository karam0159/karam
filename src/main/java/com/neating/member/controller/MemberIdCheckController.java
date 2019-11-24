package com.neating.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neating.member.svc.MemberIdCheckService;

@Controller
public class MemberIdCheckController {
	@Autowired
	private MemberIdCheckService memberIdCheckService;
	
	@RequestMapping(value="MemberIdCheck.do", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody			// 값을 view가 아니라 ajax로 보내겠음
	public String execute(@RequestParam("member_id") String member_id,HttpServletRequest request) throws Exception
	{
		String data = "0";

		int count = memberIdCheckService.MemberIdCheck(member_id);

		if(count == 1)
		{
			data = "1";
		}
		else
		{
			data = "0";
		}
		
		return data;
	}
}
