package com.neating.board.vo;

import java.sql.Timestamp;

public class BoardVO {
	private int board_index;
	private String board_class;
	private String member_id;
	private String board_title;
	private String board_content;
	private String board_image;
	private int readcount;
	private Timestamp reg_date;
	private Timestamp modify_date;
	
	public BoardVO() {};
	public BoardVO(int board_index,String board_class, String member_id, String board_title,
					String board_content, String board_image,int readcount,Timestamp reg_date,Timestamp modify_date)
	{
		this.board_index = board_index;
		this.board_class = board_class;
		this.member_id = member_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_image = board_image;
		this.readcount = readcount;
		this.reg_date = reg_date;
		this.modify_date = modify_date;
	}
	
	public int getBoard_index() {
		return board_index;
	}
	public void setBoard_index(int board_index) {
		this.board_index = board_index;
	}
	public String getBoard_class() {
		return board_class;
	}
	public void setBoard_class(String board_class) {
		this.board_class = board_class;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_image() {
		return board_image;
	}
	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getModify_date() {
		return modify_date;
	}
	public void setModify_date(Timestamp modify_date) {
		this.modify_date = modify_date;
	}
}
