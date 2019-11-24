package com.neating.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neating.board.vo.BoardVO;

@Repository
public class BoardDAO {
	SqlSessionFactory sqlSessionFactory;
	
	@Autowired			/* 자동으로 주입하게 Autowired 지정 */
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public List<BoardVO> BoardAllSelectList(String board_class) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			List<BoardVO> boardList = sqlSession.selectList("dao.BoardDAO.boardAllList", board_class);
			return boardList;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<BoardVO> BoardSelectList(int page, int limit, String board_class) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int startListNumber = (page-1)*limit;				// 해당 페이지의 첫번째 데이터 위치값
		// 1 페이지 : 0*limit = 0번째데이터부터
		// 2페이지 : 1*limit = 8번째데이터부터 
		// limit ?,? 라는게 ?번째부터 ?개를 가져온다
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		param.put("startListNumber", startListNumber);
		param.put("limit", limit);
		param.put("board_class", board_class);
		try
		{
			List<BoardVO> boardList = sqlSession.selectList("dao.BoardDAO.boardSelectList",param);
			return boardList;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int BoardInsert(BoardVO boardVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.insert("dao.BoardDAO.boardInsert",boardVO);
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public BoardVO BoardSelectOne(int board_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			BoardVO boardVO = sqlSession.selectOne("dao.BoardDAO.boardSelectOne",board_index);
			sqlSession.update("dao.BoardDAO.boardReadCount",board_index);
			
			return boardVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int BoardDelete(int board_index) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
	
		try
		{
			int count = sqlSession.delete("dao.BoardDAO.boardDelete",board_index);
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int BoardUpdate(BoardVO boardVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		int board_index = boardVO.getBoard_index();
		int count = 0;
		try
		{
			BoardVO boardVOOrigin = sqlSession.selectOne("dao.BoardDAO.boardSelectOne",board_index);
			if(!boardVO.getBoard_title().equals(boardVOOrigin.getBoard_title()))
			{
				param.put("board_title", boardVO.getBoard_title());
			}
			if(!boardVO.getBoard_content().equals(boardVOOrigin.getBoard_content()))
			{
				param.put("board_content", boardVO.getBoard_content());
			}
			if(!boardVO.getBoard_image().equals(boardVOOrigin.getBoard_image()))
			{
				param.put("board_image", boardVO.getBoard_image());
			}
			if(param.size() != 0)
			{
				param.put("board_index", board_index);
				param.put("board_class", boardVO.getBoard_class());
				count = sqlSession.update("dao.BoardDAO.boardUpdate", param);
				sqlSession.commit();
			}
			return count;
		}
		finally 
		{
			sqlSession.close();
		}
		
	}
	
	public int BoardCount() throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int count = 0;
		try
		{
			 List<BoardVO> boardVO = sqlSession.selectList("dao.BoardDAO.boardCount");
			 if(boardVO != null)
			 {
				 count = boardVO.size();
			 }
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int BoardTitleSearchAll(String board_title) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.selectOne("dao.BoardDAO.boardTitleSearchAll",board_title);
			return count;
		}
		finally 
		{
			sqlSession.close();
		}
	}
	
	public List<BoardVO> BoardTitleSearch(String board_title, int page, int limit) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int startNumber = (page-1)*limit;
		HashMap<Object, Object> param = new HashMap<Object,Object>();
		param.put("board_title", board_title);
		param.put("startNumber", startNumber);
		param.put("limit", limit);
		try
		{
			List<BoardVO> boardVO = sqlSession.selectList("dao.BoardDAO.boardTitleSearch",param);
			return boardVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int BoardTitleClassSearch(String board_class, String board_title) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		param.put("board_class", board_class);
		param.put("board_title", board_title);
		try
		{
			int count = sqlSession.selectOne("dao.BoardDAO.boardTitleClassSearch",param);
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<BoardVO> BoardTitleClassListSearch(int page, String board_class, String board_title, int limit) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int startNumber = ((page-1)*limit);
		HashMap<Object,Object> param = new HashMap<Object,Object>();
		param.put("startNumber", startNumber);
		param.put("board_class", board_class);
		param.put("board_title", board_title);
		param.put("limit", limit);
		try
		{
			List<BoardVO> boardVO = sqlSession.selectList("dao.BoardDAO.boardTitleClassList",param);
			return boardVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
}
