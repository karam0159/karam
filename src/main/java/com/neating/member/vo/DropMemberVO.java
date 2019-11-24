package com.neating.member.vo;

import java.sql.Timestamp;

public class DropMemberVO {
	private int delete_msg_index;
	private String delete_msg1;
	private String delete_msg2;
	private String delete_msg3;
	private String delete_msg;
	private Timestamp reg_date;
	
	public DropMemberVO() {};
	public DropMemberVO(int delete_msg_index, String delete_msg1, String delete_msg2,String delete_msg3,String delete_msg,Timestamp reg_date)
	{
		this.delete_msg_index = delete_msg_index;
		this.delete_msg1 = delete_msg1;
		this.delete_msg2 = delete_msg2;
		this.delete_msg3 = delete_msg3;
		this.delete_msg = delete_msg;
		this.reg_date = reg_date;
	}
	
	
	
	public int getDelete_msg_index() {
		return delete_msg_index;
	}
	public void setDelete_msg_index(int delete_msg_index) {
		this.delete_msg_index = delete_msg_index;
	}
	public String getDelete_msg1() {
		return delete_msg1;
	}
	public void setDelete_msg1(String delete_msg1) {
		this.delete_msg1 = delete_msg1;
	}
	public String getDelete_msg2() {
		return delete_msg2;
	}
	public void setDelete_msg2(String delete_msg2) {
		this.delete_msg2 = delete_msg2;
	}
	public String getDelete_msg3() {
		return delete_msg3;
	}
	public void setDelete_msg3(String delete_msg3) {
		this.delete_msg3 = delete_msg3;
	}
	public String getDelete_msg() {
		return delete_msg;
	}
	public void setDelete_msg(String delete_msg) {
		this.delete_msg = delete_msg;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
