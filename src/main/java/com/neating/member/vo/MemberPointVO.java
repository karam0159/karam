package com.neating.member.vo;

import java.sql.Timestamp;

public class MemberPointVO {
	private int memberPoint_index;
	private String member_rank;
	private int member_siteMoney;
	private Timestamp reg_date;
	
	public MemberPointVO() {};
	public MemberPointVO(int memberPoint_index,String member_rank,int member_siteMoney,Timestamp reg_date)
	{
		this.memberPoint_index = memberPoint_index;
		this.member_rank = member_rank;
		this.member_siteMoney = member_siteMoney;
		this.reg_date = reg_date;
	}
	
	public int getMemberPoint_index() {
		return memberPoint_index;
	}
	public void setMemberPoint_index(int memberPoint_index) {
		this.memberPoint_index = memberPoint_index;
	}
	public String getMember_rank() {
		return member_rank;
	}
	public void setMember_rank(String member_rank) {
		this.member_rank = member_rank;
	}
	public int getMember_siteMoney() {
		return member_siteMoney;
	}
	public void setMember_siteMoney(int member_siteMoney) {
		this.member_siteMoney = member_siteMoney;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}
