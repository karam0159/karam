package com.neating.member.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.config.SHA256Util;
import com.neating.member.svc.MemberInsertService;
import com.neating.member.vo.MemberVO;

@Controller
public class MemberInsertController {
	@Autowired
	private MemberInsertService memberInsertService;
	
	@RequestMapping(value="/Member_Insert.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_password") String member_pw,
								@RequestParam(value="account_name", required=false, defaultValue="") String account_name,
								@RequestParam(value="account_bank", required=false, defaultValue="") String account_bank,
								@RequestParam(value="account", required=false, defaultValue="") String account,
								HttpServletRequest request) throws Exception
	{
		String member_salt = SHA256Util.generateSalt();	// static 암호화
		String member_password = SHA256Util.getEncrypt(member_pw, member_salt);
		
		ModelAndView mnv = new ModelAndView();
		
		Date member_birth = java.sql.Date.valueOf(request.getParameter("member_birth"));
		
		MemberVO memberVO = new MemberVO(
				0,
				request.getParameter("member_name"),
				request.getParameter("member_id"),
				member_password,
				member_salt,
				request.getParameter("member_address"),
				request.getParameter("member_tel"),
				request.getParameter("member_email"),
				member_birth,
				null,
				0,
				5000,
				account_name,
				account_bank,
				account,
				0,
				null
				);
		
		int memberInsertCount = memberInsertService.MemberInsert(memberVO);
		if(memberInsertCount>0)
		{
			System.out.println("등록성공");
		}
		else
		{
			System.out.println("등록실패");
		}
		
		
		mnv.setViewName("redirect:/index.do");
		return mnv;
		
	}
}
