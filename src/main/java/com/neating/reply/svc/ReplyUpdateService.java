package com.neating.reply.svc;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.reply.dao.ReplyDAO;

@Service
public class ReplyUpdateService {
	@Autowired
	private ReplyDAO replyDAO;
	
	public int ReplyUpdate(String member_id, String reply_content, int reply_index) throws Exception
	{
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		param.put("member_id", member_id);
		param.put("reply_content", reply_content);
		param.put("reply_index", reply_index);
		
		int count = replyDAO.replyUpdate(param);
		return count;
	}
}
