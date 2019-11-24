package com.neating.member.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;
import com.neating.member.vo.MemberVO;

@Service
public class MemberInsertService {

	@Autowired
	private MemberDAO memberDAO;
	
	public int MemberInsert(MemberVO memberVO) throws Exception
	{
		int insertCount = memberDAO.memberInsert(memberVO);
		
		if(insertCount > 0)
		{
			System.out.println("회원가입 성공");
		}
		
		return insertCount;
	}
}
