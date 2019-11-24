package com.neating.member.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;
import com.neating.member.vo.MemberVO;

@Service
public class MemberPasswordCheckService {
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO MemberPasswordCheck(String member_id) throws Exception
	{
		MemberVO memberVO = memberDAO.memberSelectOne(member_id);
		return memberVO;
	}
}
