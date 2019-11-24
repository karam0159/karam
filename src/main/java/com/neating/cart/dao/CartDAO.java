package com.neating.cart.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neating.buyGoods.vo.BuyGoodsVO;
import com.neating.cart.vo.CartVO;

@Repository
public class CartDAO {
	SqlSessionFactory sqlSessionFactory;

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public int CartInsert(CartVO cartVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int count = 0;
		try
		{
			List<CartVO> list = sqlSession.selectList("dao.CartDAO.cartSelectAll",cartVO.getMember_id());
			int allCount = list.size();
			if(allCount < 50)
			{
				count = sqlSession.insert("dao.CartDAO.cartInsert",cartVO);
				sqlSession.commit();
			}
			
			return count;
		}
		finally 
		{
			sqlSession.close();
		}
	}
	
	public List<CartVO> CartSelectAll(String member_id) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			List<CartVO> allList = sqlSession.selectList("dao.CartDAO.cartSelectAll",member_id); 
			return allList;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<CartVO> CartSelectList(String member_id, int page, int limit) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int startListNumber = (page-1)*limit;				// 해당 페이지의 첫번째 데이터 위치값
		// 1 페이지 : 0*limit = 0번째데이터부터
		// 2페이지 : 1*limit = 8번째데이터부터 
		// limit ?,? 라는게 ?번째부터 ?개를 가져온다
		HashMap<Object,Object> param = new HashMap<Object, Object>();
		param.put("limit", limit);
		param.put("startListNumber", startListNumber);
		param.put("member_id", member_id);
		try
		{
			List<CartVO> allList = sqlSession.selectList("dao.CartDAO.cartSelectList",param); 
			return allList;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int CartDelete(int cart_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.delete("dao.CartDAO.cartDelete",cart_index);
			sqlSession.commit();
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
}
