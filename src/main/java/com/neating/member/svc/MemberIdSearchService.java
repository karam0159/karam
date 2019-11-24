package com.neating.member.svc;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;


@Service
public class MemberIdSearchService {
	@Autowired
	private MemberDAO memberDAO;
	
	public String MemberIdSearch(String member_name, String member_email) throws Exception
	{
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("member_name", member_name);
		param.put("member_email", member_email);
		String member_id = memberDAO.MemberIdSearch(param);
		String member_id_cut = "";
		String member_id_star = "";
		
		int member_id_length = member_id.length();
		
		if(member_id_length < 9)			// 문자열 삭제
		{
			member_id_cut = member_id.substring(0, member_id_length-2);
			member_id_star = member_id_cut.concat("**");
		}
		else if(member_id_length < 12)
		{
			member_id_cut = member_id.substring(0, member_id_length-3);
			member_id_star = member_id_cut.concat("***");
		}
		else
		{
			member_id_cut = member_id.substring(0, member_id_length-4);
			member_id_star = member_id_cut.concat("****");
		}
		
		return member_id_star;
	}
}
