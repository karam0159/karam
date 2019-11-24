package com.neating.member.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;
import com.neating.member.vo.MemberVO;

@Service
public class MemberUpdateService {
	@Autowired
	private MemberDAO memberDAO;
	
	public int MemberUpdate(MemberVO memberVO) throws Exception
	{
		int count = memberDAO.memberUpdate(memberVO);
		return count;
	}

}
