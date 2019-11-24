package com.neating.reply.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neating.reply.svc.ReplyInsertService;
import com.neating.reply.vo.ReplyVO;

@Controller
public class ReplyInsertController {
	@Autowired
	private ReplyInsertService replyInsertService;
	
	@RequestMapping(value="ReplyInsert.ajax", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody			// 값을 view가 아니라 ajax로 보내겠음
	public String execute(@RequestParam("member_id") String member_id,
							@RequestParam("reply_content") String reply_content,
							@RequestParam("goods_index") int goods_index,HttpServletRequest request) throws Exception
	{
		
		ReplyVO replyVO = new ReplyVO(
					0,
					member_id,
					goods_index,
					reply_content,
					null
				);
		
		int count = replyInsertService.ReplyInsert(replyVO);
		String count2 = "3";
		if(count > 0)
		{
			System.out.println("성공");
			count2 = "1";
		}
		else
		{
			System.out.println("실패");
			count2 = "0";
		}
		
		return count2;
		
	}
}
