package com.neating.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.config.SHA256Util;
import com.neating.member.svc.MemberPasswordChangeService;



@Controller
public class MemberPasswordChangeController {
	@Autowired
	private MemberPasswordChangeService memberPasswordChangeService;
	
	@RequestMapping(value="Member_Password_Change.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_password") String member_pw,
								@RequestParam("member_id") String member_id,
								@RequestParam("member_name") String member_name,
								@RequestParam("member_email") String member_email,
								HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String salt = SHA256Util.generateSalt();	// static 암호화
		String member_password = SHA256Util.getEncrypt(member_pw, salt);
		
		int count = memberPasswordChangeService.MemberPasswordChange(member_id,member_name,member_email,member_password);
	
		if(count > 0)
		{
			System.out.println("업데이트 성공");
		}
		else
		{
			System.out.println("비밀번호성공오류");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('비밀번호 변경 실패 - 정보가 다릅니다.'); location.href='index.jsp?page=member/Member_PasswordShearch.jsp';</script>");
			return null;
		}
		
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("index.jsp?page=member/Member_PasswordChangeView.jsp");
		
		return mnv;
	}
}
