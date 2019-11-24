package com.neating.manager.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.manager.svc.ManagerLoginService;
import com.neating.manager.vo.ManagerVO;

@Controller
public class ManagerLoginController {
	@Autowired
	private ManagerLoginService managerLoginService;
	
	@RequestMapping(value="Manager_Login.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("manager_id") String manager_id,
								@RequestParam("manager_password") String manager_password,HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		ManagerVO managerVO = new ManagerVO();
		
		managerVO = managerLoginService.ManagerLogin(manager_id, manager_password);
		
		if(managerVO == null)		// 틀렸을때
		{
			System.out.println("로그인실패");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('로그인실패 - 계정정보가 올바르지 않습니다.'); location.href='managerFolder/Manager_Login.jsp';</script>");
			return null;
		}
		
		if(managerVO.getManager_id().equals(manager_id) && managerVO.getManager_password().equals(manager_password))
		{
			System.out.println("로그인성공");
			mnv.setViewName("redirect:managerFolder/Manager_index.jsp");
			return mnv;
		}
		else
		{
			System.out.println("로그인실패");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer=response.getWriter();
			writer.println("<script>alert('로그인실패 - 계정정보가 올바르지 않습니다.'); location.href='managerFolder/Manager_Login.jsp';</script>");
			return null;
		}
		
		
	}
}
