package com.neating.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neating.config.SHA256Util;
import com.neating.member.vo.DropMemberVO;
import com.neating.member.vo.MemberPointVO;
import com.neating.member.vo.MemberVO;

@Repository
public class MemberDAO
{
	SqlSessionFactory sqlSessionFactory;

	@Autowired			/* 자동으로 주입하게 Autowired 지정 */
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public int memberInsert(MemberVO memberVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try
		{
			int count =  sqlSession.insert("dao.MemberDAO.memberInsert",memberVO);
			sqlSession.commit();
			return count;
		}
		
		finally 
		{
			sqlSession.close();
		}
	}
	
	public HashMap<Object, Object> memberLogin(String member_id, String member_pw) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("member_id", member_id);
		HashMap<Object, Object> memberData = new HashMap<Object, Object>();
		
		try
		{
			MemberVO memberVOOrigin = sqlSession.selectOne("dao.MemberDAO.memberSelectOne",member_id);
			if(memberVOOrigin != null)
			{
				String member_salt = memberVOOrigin.getMember_salt();
				
				String member_password = SHA256Util.getEncrypt(member_pw, member_salt);
				
				param.put("member_password", member_password);
				MemberVO memberVO = sqlSession.selectOne("dao.MemberDAO.memberLogin",param);
				
				memberData.put("member_password", member_password);
				memberData.put("memberVO", memberVO);
				
				return memberData;
			}
			return null;
			
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public MemberVO memberSelectOne(String member_id) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		try
		{
			MemberVO memberVO = sqlSession.selectOne("dao.MemberDAO.memberSelectOne",member_id);
			return memberVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int memberUpdate(MemberVO memberVO) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<Object,Object> UpdateParam = new HashMap<Object,Object>();
		
		try
		{
			MemberVO memberVO_Origin = sqlSession.selectOne("dao.MemberDAO.memberSelectOne", memberVO.getMember_id());
			if(!memberVO.getMember_name().equals(memberVO_Origin.getMember_name()))
			{
				UpdateParam.put("member_name", memberVO.getMember_name());
			}
			if(memberVO.getMember_password() != null)
			{
				if(!memberVO.getMember_password().equals(memberVO_Origin.getMember_password()))
				{
					UpdateParam.put("member_password", memberVO.getMember_password());
					UpdateParam.put("member_salt", memberVO.getMember_salt());
				}
			}
			if(!memberVO.getMember_address().equals(memberVO_Origin.getMember_address()))
			{
				UpdateParam.put("member_address", memberVO.getMember_address());
			}
			if(!memberVO.getMember_tel().equals(memberVO_Origin.getMember_tel()))
			{
				UpdateParam.put("member_tel", memberVO.getMember_tel());
			}
			if(!memberVO.getMember_email().equals(memberVO_Origin.getMember_email()))
			{
				UpdateParam.put("member_email", memberVO.getMember_email());
			}			
			if(!memberVO.getMember_birth().equals(memberVO_Origin.getMember_birth()))
			{
				UpdateParam.put("member_birth", memberVO.getMember_birth());
			}
			if(!memberVO.getAccount_name().equals(memberVO_Origin.getAccount_name()))
			{
				UpdateParam.put("account_name", memberVO.getAccount_name());
			}
			if(!memberVO.getAccount_bank().equals(memberVO_Origin.getAccount_bank()))
			{
				UpdateParam.put("account_bank", memberVO.getAccount_bank());
			}
			if(!memberVO.getAccount().equals(memberVO_Origin.getAccount()))
			{
				UpdateParam.put("account", memberVO.getAccount());
			}
			if(UpdateParam.size() > 0)
			{
				UpdateParam.put("member_id", memberVO.getMember_id());
				int count = sqlSession.update("dao.MemberDAO.memberUpdate", UpdateParam);
				sqlSession.commit();
				return count;
			}
			else
			{
				return 0;
			}
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int memberDelete(DropMemberVO dropMemberVO, String member_id) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.insert("dao.MemberDropMsgDAO.memberDropMsg", dropMemberVO);
			int count2 = sqlSession.delete("dao.MemberDAO.memberDelete",member_id);
			sqlSession.commit();
			int countF = count+count2;
			return countF;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<MemberVO> MemberAllList() throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MemberVO> MemberAllList= new ArrayList<MemberVO>();
		
		try
		{
			MemberAllList = sqlSession.selectList("dao.MemberDAO.MemberSelectALL");
			return MemberAllList;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<MemberVO> MemberSelectList(int limit, int page) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int startListNumber = (page-1)*limit;				// 해당 페이지의 첫번째 데이터 위치값
		// 1 페이지 : 0*limit = 0번째데이터부터
		// 2페이지 : 1*limit = 8번째데이터부터 
		// limit ?,? 라는게 ?번째부터 ?개를 가져온다
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		HashMap<Object,Object> param = new HashMap<Object,Object>();
		param.put("limit", limit);
		param.put("startListNumber", startListNumber);
		try
		{
			memberList = sqlSession.selectList("dao.MemberDAO.MemberSelectList",param);
			return memberList;
		}
		finally 
		{
			sqlSession.close();
		}
	}
	
	public int memberIdCheck(String member_id) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int count = 0;
		try
		{
			MemberVO memberVO = sqlSession.selectOne("dao.MemberDAO.memberSelectOne",member_id);
			if(memberVO == null)
			{
				count = 0;
			}
			else
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

	public String MemberIdSearch(HashMap<String, String> param) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			MemberVO memberVO = sqlSession.selectOne("dao.MemberDAO.memberIdSearch", param);
			String member_id = memberVO.getMember_id();
			return member_id;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int MemberPasswordChange(HashMap<String, String> param) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.update("dao.MemberDAO.memberPasswordChange", param);
			sqlSession.commit();
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int MemberCount() throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int count = 0;
		try
		{
			List<Object> countList = sqlSession.selectList("dao.MemberDAO.MemberSelectALL");
			if(countList != null)
			{
				count = countList.size();
			}
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int MemberPoint(String member_id) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.update("dao.MemberDAO.memberPoint",member_id);
			sqlSession.commit();
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	//  매니저의 회원 검색시에 비슷한 아이디를 가진 모든 회원의 숫자를 알기위해서(리스팅하기위해)
	public int ManagerMemberIdSearchAllSelectList(String member_id) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			int count = sqlSession.selectOne("dao.MemberDAO.memberIdSearchAllSelectList",member_id);
			return count;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public List<MemberVO> ManagerMemberIdSearchSelectList(String member_id, int page, int limit) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int startNumber = (page-1)*limit;
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		param.put("member_id", member_id);
		param.put("startNumber", startNumber);
		param.put("limit", limit);
		try
		{
			List<MemberVO> memberList = sqlSession.selectList("dao.MemberDAO.memberIdSearchList",param);
			return memberList;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public int MemberSiteMoneyAdd(String member_rank, int member_siteMoney) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<Object,Object> param = new HashMap<Object,Object>();
		param.put("member_rank", member_rank);
		param.put("member_siteMoney", member_siteMoney);
		try
		{
			int count = sqlSession.update("dao.MemberDAO.memberSiteMoneyAdd",param);
			int count2 = sqlSession.insert("dao.MemberDAO.memberPointRegDateInsert",param);
			return count+count2;
		}
		finally 
		{
			sqlSession.close();
		}
	}
	
	public List<MemberPointVO> MemberPointSelect() throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			List<MemberPointVO> memberPointVO = sqlSession.selectList("dao.MemberDAO.memberPointSelect");
			return memberPointVO;
		}
		finally
		{
			sqlSession.close();
		}
	}
	
	public MemberVO MemberLoginUpdate(String member_id) throws Exception
	{
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try
		{
			MemberVO memberVO = sqlSession.selectOne("dao.MemberDAO.memberLoginUpdate",member_id);
			return memberVO;
		}
		finally 
		{
			sqlSession.close();
		}
	}


}
