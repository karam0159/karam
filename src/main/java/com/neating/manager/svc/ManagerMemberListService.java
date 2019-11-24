package com.neating.manager.svc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;
import com.neating.member.vo.MemberVO;

@Service
public class ManagerMemberListService {
	@Autowired
	private MemberDAO memberDAO;
	
	public HashMap<Object, Object> ManagerMemberList(int page) throws Exception
	{
		List<MemberVO> memberAllList = memberDAO.MemberAllList();
		List<MemberVO> memberSelectList = memberDAO.MemberAllList();
		
		int memberAllCount = memberAllList.size();
		// 총 상품 량(45)
		int limit = 20;				
		// 한페이지에 보여줄 양(8)	
		Integer startPage = 1;
		
		if(page > 9)
		{
			startPage = (int) (page/10)*10;
		}	
		// 시작페이지 그게 1일수도 11일수도 21일수도
		int endPage = (int)((memberAllCount-1)/limit)+1;			
		// 종료페이지 5일수도 9일수도 14일수도
		memberSelectList = memberDAO.MemberSelectList(limit,page);
		
		HashMap<Object, Object> memberSelectListData = new HashMap<Object, Object>();
		memberSelectListData.put("startPage", startPage);
		memberSelectListData.put("endPage", endPage);
		memberSelectListData.put("memberSelectList", memberSelectList);
		
		return memberSelectListData;
	}
}
