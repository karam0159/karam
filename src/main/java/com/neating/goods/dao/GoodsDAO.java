package com.neating.goods.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neating.goods.vo.GoodsContentImageVO;
import com.neating.goods.vo.GoodsImageVO;
import com.neating.goods.vo.GoodsVO;

@Repository
public class GoodsDAO {
	SqlSessionFactory sqlSessionFactory;
	
	@Autowired			/* 자동으로 주입하게 Autowired 지정 */
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public int GoodsInsert(GoodsVO goodsVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.insert("dao.GoodsDAO.goodsInsert",goodsVO);
			sqlSession.commit();
			return count;
		}
		finally 
		{
			sqlSession.close();
		}
	}
	
	public int GoodsImageInsert(GoodsImageVO goodsImageVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<Object,Object> param = new HashMap<Object, Object>();
		param.put("goods_imageTitleSub1", goodsImageVO.getGoods_imageTitleSub1());
		param.put("goods_imageTitleSub2", goodsImageVO.getGoods_imageTitleSub2());
		param.put("goods_imageTitleSub3", goodsImageVO.getGoods_imageTitleSub3());
		
		try
		{
			GoodsVO goodsVO = sqlSession.selectOne("dao.GoodsDAO.goodsLimitOneSelect");
			int goods_index = goodsVO.getGoods_index();
			param.put("goods_index", goods_index);
			
			int count = sqlSession.insert("dao.GoodsDAO.goodsImageInsert",param);
			sqlSession.commit();
			return count;
		}
		finally 
		{
			sqlSession.close();
		}
	}
	
	public int GoodsContentImageInsert(String safeFile) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<Object,Object> param = new HashMap<Object, Object>();
		param.put("contentFile", safeFile);
		try
		{
			GoodsVO goodsVO = sqlSession.selectOne("dao.GoodsDAO.goodsLimitOneSelect");
			int goods_index = goodsVO.getGoods_index();
			param.put("goods_index", goods_index);
			
			int count = sqlSession.insert("dao.GoodsDAO.goodsContentImageInsert",param);
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<GoodsVO> GoodsAllSelect(String goods_class,String goods_kind) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<GoodsVO> GoodsAllList = new ArrayList<GoodsVO>();
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		param.put("goods_class", goods_class);
		param.put("goods_kind", goods_kind);
		
		try
		{
			if(goods_kind.equals("All"))
			{
				GoodsAllList = sqlSession.selectList("dao.GoodsDAO.goodsAllSelect",goods_class);
			}
			else
			{
				GoodsAllList = sqlSession.selectList("dao.GoodsDAO.goodsKindAllSelect",param);
			}
			
			return GoodsAllList;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<GoodsVO> GoodsSelectList(int limit, int page, String goods_class, String goods_kind) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int startListNumber = (page-1)*limit;				// 해당 페이지의 첫번째 데이터 위치값
		// 1 페이지 : 0*limit = 0번째데이터부터
		// 2페이지 : 1*limit = 8번째데이터부터 
		// limit ?,? 라는게 ?번째부터 ?개를 가져온다
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		HashMap<Object,Object> param = new HashMap<Object,Object>();
		param.put("limit", limit);
		param.put("startListNumber", startListNumber);
		param.put("goods_class", goods_class);
		param.put("goods_kind", goods_kind);
		System.out.println("goods_kind="+goods_kind);
		try
		{
			if(goods_kind.equals("All"))
			{
				goodsList = sqlSession.selectList("dao.GoodsDAO.goodsSelectList", param);
			}
			else if(goods_kind.equals("Best"))
			{
				goodsList = sqlSession.selectList("dao.GoodsDAO.goodsBestSelectList", param);
			}
			else
			{
				goodsList = sqlSession.selectList("dao.GoodsDAO.goodsKindSelectList", param);
			}
			return goodsList;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public HashMap<Object, Object> GoodsSelectOne(int goods_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			GoodsVO goodsVO = sqlSession.selectOne("dao.GoodsDAO.goodsSelectOne",goods_index);
			GoodsImageVO goodsImageVO = sqlSession.selectOne("dao.GoodsDAO.goodsImageSelectOne",goods_index);
			List<GoodsContentImageVO> contentImageList = sqlSession.selectList("dao.GoodsDAO.goodsContentImageSelectList",goods_index);
			sqlSession.update("dao.GoodsDAO.goodsReadcount",goodsVO.getGoods_index());
			sqlSession.commit();
			HashMap<Object, Object> param = new HashMap<Object, Object>();
			param.put("goodsVO", goodsVO);
			param.put("goodsImageVO", goodsImageVO);
			param.put("contentImageList", contentImageList);
			return param;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public GoodsVO GoodsVOSelectOne(int goods_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			GoodsVO goodsVO = sqlSession.selectOne("dao.GoodsDAO.goodsSelectOne",goods_index);
			sqlSession.update("dao.GoodsDAO.goodsReadcount",goodsVO.getGoods_index());
			sqlSession.commit();
			return goodsVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int GoodsDelete(int goods_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.delete("dao.GoodsDAO.goodsDelete",goods_index);
			int count2 = sqlSession.delete("dao.GoodsDAO.goodsImageDelete",goods_index);
			int count3 = sqlSession.delete("dao.GoodsDAO.goodsContentImageDelete",goods_index);
			return count+count2+count3;
		}
		finally 
		{
			sqlSession.close();
		}
	}
	
	public int GoodsUpdate(GoodsVO goodsVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int goods_index = goodsVO.getGoods_index();
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		param.put("goods_class", goodsVO.getGoods_class());
		int count = 0;
		try
		{
			GoodsVO goodsVOOrigin = sqlSession.selectOne("dao.GoodsDAO.goodsSelectOne",goods_index);
			if(!goodsVO.getGoods_name().equals(goodsVOOrigin.getGoods_name()))
			{
				param.put("goods_name", goodsVO.getGoods_name());
			}
			if(!goodsVO.getGoods_kind().equals(goodsVOOrigin.getGoods_name()))
			{
				param.put("goods_kind", goodsVO.getGoods_kind());
			}
			if(!goodsVO.getGoods_imageTitle().equals(goodsVOOrigin.getGoods_imageTitle()))
			{
				param.put("goods_imageTitle", goodsVO.getGoods_imageTitle());
			}
			if(goodsVO.getGoods_countS()!=goodsVOOrigin.getGoods_countS())
			{
				param.put("goods_countS", goodsVO.getGoods_countS());
			}
			if(goodsVO.getGoods_countM()!=goodsVOOrigin.getGoods_countM())
			{
				param.put("goods_countM", goodsVO.getGoods_countM());
			}
			if(goodsVO.getGoods_countL()!=goodsVOOrigin.getGoods_countL())
			{
				param.put("goods_countL", goodsVO.getGoods_countL());
			}
			if(goodsVO.getGoods_price()!=goodsVOOrigin.getGoods_price())
			{
				param.put("goods_price", goodsVO.getGoods_price());
			}
			if(goodsVO.getGoods_sale()!=goodsVOOrigin.getGoods_sale())
			{
				param.put("goods_sale", goodsVO.getGoods_sale());
			}
			if(goodsVO.getGoods_lastprice()!=goodsVOOrigin.getGoods_lastprice())
			{
				param.put("goods_getGoods_lastprice", goodsVO.getGoods_lastprice());
			}
			if(goodsVO.getGoods_content().equals(goodsVO.getGoods_content()))
			{
				param.put("goods_content", goodsVO.getGoods_content());
			}
			if(param.size() > 0)
			{
				param.put("goods_index", goods_index);
				count = sqlSession.update("dao.GoodsDAO.goodsUpdate",param);
				sqlSession.commit();
			}
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int GoodsImageUpdate(GoodsImageVO goodsImageVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.update("dao.GoodsDAO.goodsImageUpdate",goodsImageVO);
			sqlSession.commit();
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int GoodsContentImageUpdate(String contentFile,int goods_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<Object, Object> param = new HashMap<Object,Object>();
		param.put("contentFile", contentFile);
		param.put("goods_index", goods_index);
		try
		{
			int count = sqlSession.delete("dao.GoodsDAO.goodsContentImageDelete",goods_index);
			int count2 = sqlSession.insert("dao.GoodsDAO.goodsContentImageInsert",param);
			sqlSession.commit();
			return count+count2;
		}
		finally 
		{
			sqlSession.close();
		}
	}
	
	public List<GoodsVO> GoodsSelectListMain() throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			List<GoodsVO> goodsVO = sqlSession.selectList("dao.GoodsDAO.goodsSelectListMain");
			return goodsVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int GoodsCount() throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int count = 0;
		try
		{
			List<GoodsVO> goodsVO = sqlSession.selectList("dao.GoodsDAO.goodsCount");
			if(goodsVO != null)
			{
				count = goodsVO.size();
			}
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int GoodsNameCheck(String goods_name, String goods_class) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int count = 0;
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		param.put("goods_name", goods_name);
		param.put("goods_class", goods_class);
		
		try
		{
			GoodsVO goodsVO = sqlSession.selectOne("dao.GoodsDAO.goodsNameCheck",param);
			if(goodsVO != null)
			{
				count = 1;
			}
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int GoodsSearchAllCount(String goods_name) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			List<GoodsVO> goodsVO = sqlSession.selectList("dao.GoodsDAO.goodsSearchAllCount",goods_name);
			int count = goodsVO.size();
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<GoodsVO> GoodsSearch(String goods_name,int page, int limit) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int startNumber = (page-1)*limit;
		HashMap<Object, Object> param = new HashMap<Object , Object>();
		param.put("goods_name", goods_name);
		param.put("startNumber", startNumber);
		param.put("limit", limit);
		try
		{
			List<GoodsVO> goodsVO = sqlSession.selectList("dao.GoodsDAO.goodsSearchList",param);
			return goodsVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int GoodsNameSearchAllSelect(String goods_name) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.selectOne("dao.GoodsDAO.goodsNameSearchAll",goods_name);
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<GoodsVO> GoodsNameSearchSelect(String goods_name, int page, int limit) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int startNumber = (page-1)*limit;
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		param.put("goods_name", goods_name);
		param.put("startNumber", startNumber);
		param.put("limit", limit);
		try
		{
			List<GoodsVO> goodsVO = sqlSession.selectList("dao.GoodsDAO.goodsNameSearchSelect",param);
			return goodsVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
}

