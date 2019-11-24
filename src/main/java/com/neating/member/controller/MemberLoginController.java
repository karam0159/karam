package com.neating.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.member.svc.MemberLoginService;
import com.neating.member.vo.MemberVO;

@Controller
public class MemberLoginController {
	@Autowired
	private MemberLoginService memberLoginService;
	
	@RequestMapping(value="/Member_Login.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_id") String member_id,
								@RequestParam("member_password") String member_pw,HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		HttpSession session = request.getSession();	
		System.out.println("로그인단계");
		
		HashMap<Object, Object> memberData = memberLoginService.MemberLogin(member_id, member_pw);
		
		if(memberData != null)
		{
			MemberVO memberVO = (MemberVO) memberData.get("memberVO");
			if(memberVO == null)		// 아이디는 맞는데 비번은 다름
			{
				System.out.println("로그인실패-비밀번호오류");
				response.setContentType("text/html;charset=utf-8");
				PrintWriter writer=response.getWriter();
				writer.println("<script>alert('로그인실패 - 계정정보가 올바르지 않습니다.'); location.href='index.jsp?page=member/Member_Login.jsp';</script>");
				return null;
			}
			
			String member_password = memberVO.getMember_password();
			System.out.println(member_password);
			String member_CheckId = "ㅇㅇ";
			String member_CheckPassword = "ㅇㅇ";
			
			if(memberVO != null)
			{
				member_CheckId = memberVO.getMember_id();
				member_CheckPassword = (String) memberData.get("member_password");
			}
			
			if(member_id.equals(member_CheckId) && member_password.equals(member_CheckPassword))
			{
				System.out.println("로그인성공");
				mnv.setViewName("redirect:/index.do");
			//	mnv.addObject("memberVO",memberVO);
				session.setAttribute("memberVO", memberVO);
				//mnv.addObject("memberVO", memberVO);
				return mnv;
				
			}
			else
			{
				System.out.println("로그인실패-비밀번호오류");
				response.setContentType("text/html;charset=utf-8");
				PrintWriter writer=response.getWriter();
				writer.println("<script>alert('로그인실패 - 계정정보가 올바르지 않습니다.'); location.href='index.jsp?page=member/Member_Login.jsp';</script>");
				return null;
			}
			
		}
		else
		{
			System.out.println("로그인실패-비밀번호오류");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('로그인실패 - 계정정보가 올바르지 않습니다.'); location.href='index.jsp?page=member/Member_Login.jsp';</script>");
			return null;
		}
	}
}
