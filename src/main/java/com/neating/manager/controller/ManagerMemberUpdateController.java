package com.neating.manager.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.config.SHA256Util;
import com.neating.member.svc.MemberUpdateService;
import com.neating.member.vo.MemberVO;

@Controller
public class ManagerMemberUpdateController {
	@Autowired
	private MemberUpdateService memberUpdateService;
	
	@RequestMapping(value="/managerFolder/Manager_Member_Update.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_id") String member_id,
								@RequestParam(value="member_password" ,required=false, defaultValue="") String member_pw,
								@RequestParam(value="account_name", required=false, defaultValue="") String account_name,
								@RequestParam(value="account_bank", required=false, defaultValue="") String account_bank,
								@RequestParam(value="account", required=false, defaultValue="") String account,HttpServletRequest request) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		
		Date member_birth = java.sql.Date.valueOf(request.getParameter("member_birth"));
		
	//	String member_salt = SHA256Util.generateSalt();
	//	String member_password = SHA256Util.getEncrypt(member_pw, member_salt);
		
		MemberVO memberVO = new MemberVO(
				0,
				request.getParameter("member_name"),
				member_id,
				null,
				null,
				request.getParameter("member_address"),
				request.getParameter("member_tel"),
				request.getParameter("member_email"),
				member_birth,
				null,
				0,
				0,
				account_name,
				account_bank,
				account,
				0,
				null
				);

		
		int memberUpdateCount = memberUpdateService.MemberUpdate(memberVO);
		if(memberUpdateCount > 0)
		{
			System.out.println("수정 성공");
		}
		else
		{
			System.out.println("수정 실패");
		}
		mnv.setViewName("redirect:Manager_Member_Select.do?member_id="+memberVO.getMember_id());
		return mnv;
	}
}
