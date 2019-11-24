package com.neating.member.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;
import com.neating.member.vo.DropMemberVO;

@Service
public class MemberDeleteService {
	@Autowired
	private MemberDAO memberDAO;
	
	public int MemberDelete(DropMemberVO dropMemberVO, String member_id) throws Exception
	{
		int count = memberDAO.memberDelete(dropMemberVO, member_id);
		return count;
	}
}
