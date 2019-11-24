package com.neating.reply.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.reply.dao.ReplyDAO;
import com.neating.reply.vo.ReplyVO;

@Service
public class ReplyInsertService {
	@Autowired
	private ReplyDAO replyDAO;
	
	public int ReplyInsert(ReplyVO replyVO) throws Exception
	{
		int count = replyDAO.ReplyInsert(replyVO);
		return count;
	}
}
