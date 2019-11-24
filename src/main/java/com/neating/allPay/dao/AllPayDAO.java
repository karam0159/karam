package com.neating.allPay.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neating.allPay.vo.AllPayVO;

@Repository
public class AllPayDAO {
	private SqlSessionFactory sqlSessionFactory;
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public int AllPaySelect() throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int allPayCount = 0;
		try
		{
			AllPayVO allPayVO = sqlSession.selectOne("dao.AllPayDAO.allPaySelect");
			if(allPayVO != null)
			{
				allPayCount = allPayVO.getAllPay();
			}
			 
			return allPayCount;
		}
		finally
		{
			sqlSession.close();
		}
	}
}
