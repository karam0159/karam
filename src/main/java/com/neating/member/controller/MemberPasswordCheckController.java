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
import com.neating.member.svc.MemberPasswordCheckService;
import com.neating.member.vo.MemberVO;

@Controller
public class MemberPasswordCheckController {
	@Autowired
	private MemberPasswordCheckService memberPasswordCheckService;
	@RequestMapping(value="MemberPasswordCheck.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_id") String member_id,
								@RequestParam("member_password") String member_pw,HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		MemberVO memberVO = memberPasswordCheckService.MemberPasswordCheck(member_id);
		String member_salt = memberVO.getMember_salt();
		
		String member_passwordOrigin = memberVO.getMember_password();
		String member_passwordNow = SHA256Util.getEncrypt(member_pw, member_salt);
		
		if(member_passwordOrigin.equals(member_passwordNow))
		{
			System.out.println("비밀번호 일치");
			mnv.setViewName("index.jsp?page=member/Member_Delete.jsp");
			return mnv;
		}
		else
		{
			System.out.println("로그인실패-비밀번호오류");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('로그인실패 - 계정정보가 올바르지 않습니다.'); location.href='index.jsp?page=member/Member_PasswordMatch.jsp';</script>");
			return null;
		}
	}
}
