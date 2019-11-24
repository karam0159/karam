package com.neating.reply.svc;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.reply.dao.ReplyDAO;

@Service
public class ReplyDeleteService {
	@Autowired
	private ReplyDAO replyDAO;
	
	public int ReplyDelete(String member_id, int reply_index) throws Exception
	{
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		param.put("member_id", member_id);
		param.put("reply_index", reply_index);
		
		int count = replyDAO.replyDelete(param);
		return count;
	}
}
