package com.neating.manager.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;

@Service
public class ManagerMemberSiteMoneyService {
	@Autowired
	private MemberDAO memberDAO;
	
	public int ManagerMemberSiteMoney(String member_rank,int member_siteMoney) throws Exception
	{
		int count = memberDAO.MemberSiteMoneyAdd(member_rank,member_siteMoney);
		return count;
	}
}
