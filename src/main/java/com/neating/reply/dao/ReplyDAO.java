package com.neating.reply.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neating.goods.vo.GoodsVO;
import com.neating.reply.vo.ReplyVO;

@Repository
public class ReplyDAO {
	private SqlSessionFactory sqlSessionFactory;

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public int ReplyInsert(ReplyVO replyVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.insert("dao.ReplyDAO.replyInsert",replyVO);
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<ReplyVO> ReplyAllSelectList(int goods_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			List<ReplyVO> replyVO = sqlSession.selectList("dao.ReplyDAO.replyAllSelect",goods_index);
			return replyVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<ReplyVO> ReplySelectList(int page, int limit, int goods_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int startListNumber = (page-1)*limit;				// 해당 페이지의 첫번째 데이터 위치값
		// 1 페이지 : 0*limit = 0번째데이터부터
		// 2페이지 : 1*limit = 8번째데이터부터 
		// limit ?,? 라는게 ?번째부터 ?개를 가져온다
		HashMap<Object,Object> param = new HashMap<Object,Object>();
		param.put("limit", limit);
		param.put("startListNumber", startListNumber);
		param.put("goods_index", goods_index);
		try
		{
			List<ReplyVO> replyVO = sqlSession.selectList("dao.ReplyDAO.replySelectList",param);
			return replyVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int replyUpdate(HashMap<Object, Object> param) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.update("dao.ReplyDAO.replyUpdate",param);
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int replyDelete(HashMap<Object, Object> param) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.delete("dao.ReplyDAO.replyDelete",param);
			return count;
		}
		finally 
		{
			sqlSession.close();
		}
	}
}
