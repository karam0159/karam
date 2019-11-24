package com.neating.manager.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.allPay.dao.AllPayDAO;
import com.neating.board.dao.BoardDAO;
import com.neating.goods.dao.GoodsDAO;
import com.neating.member.dao.MemberDAO;
import com.neating.member.vo.MemberPointVO;

@Service
public class ManagerMainService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private AllPayDAO allPayDAO;
	
	public int ManagerMainMemberCount() throws Exception
	{
		int count = memberDAO.MemberCount();
		return count;
	}
	public int ManagerMainGoodsCount() throws Exception
	{
		int count = goodsDAO.GoodsCount();
		return count;
	}
	public int ManagerMainBoardCount() throws Exception
	{
		int count = boardDAO.BoardCount();
		return count;
	}
	public int ManagerAllPayCount() throws Exception
	{
		int count = allPayDAO.AllPaySelect();
		return count;
	}
	public List<MemberPointVO> ManagerMainMemberPoint() throws Exception
	{
		List<MemberPointVO> memberPointVO = memberDAO.MemberPointSelect();
		return memberPointVO;
	}
	
}
