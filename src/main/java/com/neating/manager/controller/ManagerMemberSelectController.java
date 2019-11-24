package com.neating.manager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.member.svc.MemberMyPageService;
import com.neating.member.vo.MemberVO;

@Controller
public class ManagerMemberSelectController {
	@Autowired
	private MemberMyPageService memberMyPageService;
	
	@RequestMapping(value="managerFolder/Manager_Member_Select.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_id") String member_id,HttpServletRequest request) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		MemberVO memberVO = memberMyPageService.MemberMyPage(member_id);
		
		mnv.addObject("memberVO", memberVO);
		mnv.setViewName("Manager_index.jsp?page=memberManage/Manager_Member_MyPage.jsp");
		return mnv;
		
	}
	
}
