package com.neating.manager.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;

@Service
public class ManagerMemberPointService {
	@Autowired
	private MemberDAO memberDAO;
	
	public int ManagerMemberPoint(String member_id) throws Exception
	{
		int count = memberDAO.MemberPoint(member_id);
		return count;
	}
}
