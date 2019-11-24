package com.neating.member.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;
import com.neating.member.vo.MemberVO;

@Service
public class MemberIdCheckService {
	@Autowired
	private MemberDAO memberDAO;
	
	public int MemberIdCheck(String member_id) throws Exception
	{
		int count = memberDAO.memberIdCheck(member_id);
		return count;
	}
}
