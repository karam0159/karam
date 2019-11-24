package com.neating.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.member.svc.MemberDeleteService;
import com.neating.member.vo.DropMemberVO;

@Controller
public class MemberDeleteController {
	@Autowired
	private MemberDeleteService memberDeleteService;
	
	@RequestMapping(value="Member_Delete.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_id") String member_id,
								@RequestParam(value="deleteMsg1", required=false, defaultValue="없음") String deleteMsg1,
								@RequestParam(value="deleteMsg2", required=false, defaultValue="없음") String deleteMsg2,
								@RequestParam(value="deleteMsg3", required=false, defaultValue="없음") String deleteMsg3,
								@RequestParam(value="deleteMsg", required=false, defaultValue="없음") String deleteMsg ,HttpServletRequest request) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		DropMemberVO dropMemberVO = new DropMemberVO
				(
						0,
						deleteMsg1,
						deleteMsg2,
						deleteMsg3,
						deleteMsg,
						null
				);
		
		int count = memberDeleteService.MemberDelete(dropMemberVO,member_id);
		if(count == 2)
		{
			System.out.println("삭제와 등록 성공");
		}
		else
		{
			System.out.println("둘중하나 실패");
		}
		mnv.setViewName("redirect:Member_Logout.do");
		return mnv;
	}
}
