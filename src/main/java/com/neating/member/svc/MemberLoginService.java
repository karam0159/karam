package com.neating.member.svc;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;
import com.neating.member.vo.MemberVO;

@Service
public class MemberLoginService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public HashMap<Object, Object> MemberLogin(String member_id, String member_pw) throws Exception
	{
		HashMap<Object, Object> memberData = memberDAO.memberLogin(member_id, member_pw);
		return memberData;
	}
	
	public MemberVO MemberLoginUpdate(String member_id) throws Exception
	{
		MemberVO memberVO = memberDAO.MemberLoginUpdate(member_id);
		return memberVO;
	}
}
