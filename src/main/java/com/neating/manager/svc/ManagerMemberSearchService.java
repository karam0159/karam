package com.neating.manager.svc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;
import com.neating.member.vo.MemberVO;

@Service
public class ManagerMemberSearchService {
	@Autowired
	private MemberDAO memberDAO;
	
	public HashMap<Object, Object> ManagerMemberSearch(String member_id, int page) throws Exception
	{
		int limit = 20;
		int listCount = memberDAO.ManagerMemberIdSearchAllSelectList(member_id);
		Integer startPage = 1;
		if(page > 9)
		{
			startPage = (page/10)*10;
		}
		int endPage = ((listCount-1)/limit)+1;

		
		List<MemberVO> memberList = memberDAO.ManagerMemberIdSearchSelectList(member_id, page, limit);
		HashMap<Object, Object> memberListdata = new HashMap<Object, Object>();
		memberListdata.put("startPage", startPage);
		memberListdata.put("endPage", endPage);
		memberListdata.put("memberList", memberList);
		
		return memberListdata;
	
	}
}
