package com.neating.member.svc;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.member.dao.MemberDAO;


@Service
public class MemberPasswordChangeService {
	@Autowired
	private MemberDAO memberDAO;
	
	public int MemberPasswordChange(String member_id, String member_name, String member_email,String member_password) throws Exception
	{
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("member_id", member_id);
		param.put("member_name", member_name);
		param.put("member_email", member_email);
		param.put("member_password", member_password);
		int count = memberDAO.MemberPasswordChange(param);
		
		return count;
	}
}
