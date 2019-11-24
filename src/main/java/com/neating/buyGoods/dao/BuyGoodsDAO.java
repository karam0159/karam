package com.neating.buyGoods.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neating.buyGoods.vo.BuyGoodsVO;
import com.neating.member.vo.MemberVO;

@Repository
public class BuyGoodsDAO {
	SqlSessionFactory sqlSessionFactory;
	
	@Autowired			/* 자동으로 주입하게 Autowired 지정 */
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public int BuyGoodsInsert(BuyGoodsVO buyGoodsVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		// 상품에서 구입한 갯수 빼기
		int goods_index = buyGoodsVO.getGoods_index();
		int goods_countS = buyGoodsVO.getGoods_countS();
		int goods_countM = buyGoodsVO.getGoods_countM();
		int goods_countL = buyGoodsVO.getGoods_countL();
		
		HashMap<Object,Object> param = new HashMap<Object,Object>();
		param.put("goods_index", goods_index);
		param.put("goods_countS", goods_countS);
		param.put("goods_countM", goods_countM);
		param.put("goods_countL", goods_countL);
		
		// 사용자의 사용한 적립금 차감
		int member_siteMoney = buyGoodsVO.getMember_usesitemoney();
		String member_id = buyGoodsVO.getMember_id();
		
		System.out.println(member_siteMoney);
		System.out.println(member_id);
		
		HashMap<Object,Object> param2 = new HashMap<Object,Object>();
		param2.put("member_siteMoney", member_siteMoney);
		param2.put("member_id", member_id);

		try
		{
			int count = sqlSession.insert("dao.BuyGoodsDAO.buyGoodsInsert",buyGoodsVO);
			int count2 = sqlSession.update("dao.GoodsDAO.buyGoodsCountMinus",param);
			int count3 = sqlSession.update("dao.MemberDAO.memberUseSiteMoney",param2);
			
			int count4 = count+count2+count3;
			sqlSession.commit();
			return count4;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<BuyGoodsVO> BuyGoodsSelectAll(String member_id) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BuyGoodsVO> allList = new ArrayList<BuyGoodsVO>();
		try
		{
			if(member_id.equals("All"))
			{
				allList = sqlSession.selectList("dao.BuyGoodsDAO.buyGoodsSelectAllIdAll"); 
			}
			else
			{
				allList = sqlSession.selectList("dao.BuyGoodsDAO.buyGoodsSelectAll",member_id); 
			}
			return allList;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<BuyGoodsVO> BuyGoodsSelectList(String member_id, int page, int limit) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BuyGoodsVO> allList = new ArrayList<BuyGoodsVO>();
		
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
			if(member_id.equals("All"))
			{
				allList = sqlSession.selectList("dao.BuyGoodsDAO.buyGoodsSelectListAllIdAll",param); 
			}
			else
			{
				allList = sqlSession.selectList("dao.BuyGoodsDAO.buyGoodsSelectList",param); 
			}
			return allList;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public BuyGoodsVO BuyGoodsSelectOne(int buy_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			BuyGoodsVO buyGoodsVO = sqlSession.selectOne("dao.BuyGoodsDAO.buyGoodsSelectOne",buy_index);
			return buyGoodsVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int BuyGoodsUpdate(BuyGoodsVO buyGoodsVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int buy_index = buyGoodsVO.getBuy_index();
		
		HashMap<Object,Object> param2 = new HashMap<Object, Object>();
		
		try
		{
			int count = -1;
			BuyGoodsVO buyGoodsVOOrign = sqlSession.selectOne("dao.BuyGoodsDAO.buyGoodsSelectOne",buy_index);
			
			if(!buyGoodsVO.getMember_name().equals(buyGoodsVOOrign.getMember_name()))
			{
				param2.put("member_name", buyGoodsVO.getMember_name());
			}
			if(!buyGoodsVO.getMember_tel().equals(buyGoodsVOOrign.getMember_tel()))
			{
				param2.put("member_tel", buyGoodsVO.getMember_tel());
			}
			if(!buyGoodsVO.getMember_address().equals(buyGoodsVOOrign.getMember_address()))
			{
				param2.put("member_address", buyGoodsVO.getMember_address());
			}
			if(!buyGoodsVO.getDel_name().equals(buyGoodsVOOrign.getDel_name()))
			{
				param2.put("del_name", buyGoodsVO.getDel_name());
			}
			if(!buyGoodsVO.getDel_tel().equals(buyGoodsVOOrign.getDel_tel()))
			{
				param2.put("del_tel", buyGoodsVO.getDel_tel());
			}
			if(!buyGoodsVO.getDel_address().equals(buyGoodsVOOrign.getDel_address()))
			{
				param2.put("del_address", buyGoodsVO.getDel_address());
			}
			if(!buyGoodsVO.getDel_request().equals(buyGoodsVOOrign.getDel_request()))
			{
				param2.put("del_request", buyGoodsVO.getDel_request());
			}
			if(!buyGoodsVO.getAccount_name().equals(buyGoodsVOOrign.getAccount_name()))
			{
				param2.put("account_name", buyGoodsVO.getAccount_name());
			}
			if(!buyGoodsVO.getAccount_bank().equals(buyGoodsVOOrign.getAccount_bank()))
			{
				param2.put("account_bank", buyGoodsVO.getAccount_bank());
			}
			if(!buyGoodsVO.getAccount().equals(buyGoodsVOOrign.getAccount()))
			{
				param2.put("account", buyGoodsVO.getAccount());
			}
			if(param2.size() != 0)
			{
				param2.put("buy_index", buy_index);
				count = sqlSession.update("dao.BuyGoodsDAO.buyGoodsUpdate",param2);
			}
			return count;
		}
		finally 
		{
			sqlSession.close();
		}
	}
	
	public int BuyGoodsDelete(int buy_index, int member_usesitemoney, String member_id) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<Object, Object> param = new HashMap<Object,Object>();
		param.put("member_usesitemoney", member_usesitemoney);
		param.put("member_id", member_id);
		try
		{
			int count = sqlSession.delete("dao.BuyGoodsDAO.buyGoodsDelete",buy_index);
			int count2 = sqlSession.update("dao.MemberDAO.memberSiteMoneyReturn",param);
			int count3 = count+count2;
			return count3;
		}
		finally 
		{
			sqlSession.close();
		}
	}
	
	public int BuyGoodsPay(int buy_index,String member_id,int goods_lastprice) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<Object, Object> param = new HashMap<Object,Object>();
		param.put("member_id", member_id);
		param.put("goods_lastprice", goods_lastprice);
		
		try
		{
			MemberVO memberVO = sqlSession.selectOne("dao.MemberDAO.memberSelectOne",member_id);
			int member_gold=memberVO.getMember_gold();
			if(member_gold >= 100000 && member_gold < 200000)
			{
				param.put("member_rank", "silver");
			}
			else if(member_gold >= 200000 && member_gold < 300000)
			{
				param.put("member_rank", "gold");
			}
			else if(member_gold >= 300000)
			{
				param.put("member_rank", "diamond");
			}
			else
			{
				param.put("member_rank", "bronze");
			}
			int count = sqlSession.update("dao.BuyGoodsDAO.buyGoodsPay",buy_index);
			int count2 = sqlSession.update("dao.MemberDAO.MemberSellUpdate",param);
			int count3 = sqlSession.update("dao.AllPayDAO.allPayUpdate",goods_lastprice);
			int count4 = count+count2+count3;
			sqlSession.commit();
			return count4;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int BuyGoodsDelGo(int buy_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.update("dao.BuyGoodsDAO.buyGoodsDelGo",buy_index);
			sqlSession.commit();
			return count;
		}
		finally 
		{
			sqlSession.close();
		}
	}
}
