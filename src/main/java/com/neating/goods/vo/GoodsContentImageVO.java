package com.neating.goods.vo;

import java.sql.Timestamp;

public class GoodsContentImageVO {
	private int goods_ContentImage_index;
	private String goods_ContentImage;
	private Timestamp reg_date;
	private int goods_index;
	
	public GoodsContentImageVO() {};
	public GoodsContentImageVO(int goods_image_index,String goods_ContentImage,Timestamp reg_date,int goods_index)
	{
		this.goods_ContentImage_index = goods_image_index;
		this.goods_ContentImage = goods_ContentImage;
		this.reg_date = reg_date;
		this.goods_index = goods_index;
	}
	public int getGoods_ContentImage_index() {
		return goods_ContentImage_index;
	}
	public void setGoods_ContentImage_index(int goods_ContentImage_index) {
		this.goods_ContentImage_index = goods_ContentImage_index;
	}
	public String getGoods_ContentImage() {
		return goods_ContentImage;
	}
	public void setGoods_ContentImage(String goods_ContentImage) {
		this.goods_ContentImage = goods_ContentImage;
	}
	public int getGoods_index() {
		return goods_index;
	}
	public void setGoods_index(int goods_index) {
		this.goods_index = goods_index;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
