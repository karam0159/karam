package com.neating.reply.vo;

import java.sql.Timestamp;

public class ReplyVO {
	private int reply_index;
	private String member_id;
	private int goods_index;
	private String reply_content;
	private Timestamp reg_date;
	
	public ReplyVO() {};
	public ReplyVO(int reply_index,String member_id,int goods_index,String reply_content,Timestamp reg_date)
	{
		this.reply_index = reply_index;
		this.member_id = member_id;
		this.goods_index = goods_index;
		this.reply_content = reply_content;
		this.reg_date = reg_date;
	}
	
	
	
	public int getReply_index() {
		return reply_index;
	}
	public void setReply_index(int reply_index) {
		this.reply_index = reply_index;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getGoods_index() {
		return goods_index;
	}
	public void setGoods_index(int goods_index) {
		this.goods_index = goods_index;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
