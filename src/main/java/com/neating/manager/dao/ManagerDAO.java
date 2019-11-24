package com.neating.manager.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neating.manager.vo.ManagerVO;

@Repository
public class ManagerDAO {
	SqlSessionFactory sqlSessionFactory;

	@Autowired			/* 자동으로 주입하게 Autowired 지정 */
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public ManagerVO ManagerLogin(String manager_id, String manager_password) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("manager_id", manager_id);
		param.put("manager_password", manager_password);
		
		try
		{
			ManagerVO managerVO = sqlSession.selectOne("dao.ManagerDAO.managerLogin",param);
			if(managerVO == null)
			{
				managerVO = null;
			}
			return managerVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	
}
