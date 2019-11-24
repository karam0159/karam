package com.neating.manager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.manager.svc.ManagerMemberSiteMoneyService;

@Controller
public class ManagerMemberSiteMoneyController {
	@Autowired
	private ManagerMemberSiteMoneyService managerMemberSiteMoneyService;
	@RequestMapping(value="managerFolder/ManagerMemberSiteMoney.do" ,method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("member_rank") String member_rank,
								@RequestParam("member_siteMoney") int member_siteMoney,HttpServletRequest request) throws Exception
	{
		int count = managerMemberSiteMoneyService.ManagerMemberSiteMoney(member_rank,member_siteMoney);
		if(count == 2)
		{
			System.out.println("성공");
		}
		else
		{
			System.out.println("실패");
		}
		
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("redirect:Manager_index.jsp");
		
		return mnv;
	}
}
