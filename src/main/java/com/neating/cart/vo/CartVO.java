package com.neating.cart.vo;

import java.sql.Timestamp;

public class CartVO {
	private int cart_index;
	private String member_id;
	private int goods_index;
	private String goods_name;
	private int goods_price;
	private String goods_imageTitle;
	private Timestamp reg_date;
	
	
	public CartVO() {};
	public CartVO(int cart_index,String member_id,int goods_index,String goods_name,int goods_price,String goods_imageTitle,Timestamp reg_date)
	{
		this.cart_index = cart_index;
		this.member_id = member_id;
		this.goods_index = goods_index;
		this.goods_name = goods_name;
		this.goods_price = goods_price;
		this.goods_imageTitle = goods_imageTitle;
		this.reg_date = reg_date;
	}

	public int getCart_index() {
		return cart_index;
	}
	public void setCart_index(int cart_index) {
		this.cart_index = cart_index;
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
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_imageTitle() {
		return goods_imageTitle;
	}
	public void setGoods_imageTitle(String goods_imageTitle) {
		this.goods_imageTitle = goods_imageTitle;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
