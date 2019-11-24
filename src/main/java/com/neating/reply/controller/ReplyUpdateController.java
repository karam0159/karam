package com.neating.reply.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neating.reply.svc.ReplyUpdateService;

@Controller
public class ReplyUpdateController {
	@Autowired
	private ReplyUpdateService replyUpdateService;
	
	@RequestMapping(value="ReplyUpdate.ajax" ,method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String execute(@RequestParam("member_id") String member_id,
							@RequestParam("reply_content") String reply_content,
							@RequestParam("reply_index") int reply_index,HttpServletRequest request) throws Exception
	{
		int count = replyUpdateService.ReplyUpdate(member_id,reply_content,reply_index);
		String countX = "";
		if(count > 0)
		{
			System.out.println("성공");
			countX = "1";
		}
		else
		{
			System.out.println("실패");
			countX = "0";
		}
		return countX;
	}
}
