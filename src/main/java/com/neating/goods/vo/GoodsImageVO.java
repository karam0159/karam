package com.neating.goods.vo;

import java.sql.Timestamp;

public class GoodsImageVO {
	private int goods_image_index;
	private String goods_imageTitleSub1;
	private String goods_imageTitleSub2;
	private String goods_imageTitleSub3;
	private Timestamp reg_date;
	private int goods_index;
	
	public GoodsImageVO() {};
	public GoodsImageVO(int goods_image_index,String goods_imageTitleSub1,
			String goods_imageTitleSub2,String goods_imageTitleSub3,Timestamp reg_date,int goods_index)
	{
		this.goods_image_index = goods_image_index;
		this.goods_imageTitleSub1 = goods_imageTitleSub1;
		this.goods_imageTitleSub2 = goods_imageTitleSub2;
		this.goods_imageTitleSub3 = goods_imageTitleSub3;
		this.reg_date = reg_date;
		this.goods_index = goods_index;
	}
	
	
	
	public int getGoods_image_index() {
		return goods_image_index;
	}
	public void setGoods_image_index(int goods_image_index) {
		this.goods_image_index = goods_image_index;
	}
	public String getGoods_imageTitleSub1() {
		return goods_imageTitleSub1;
	}
	public void setGoods_imageTitleSub1(String goods_imageTitleSub1) {
		this.goods_imageTitleSub1 = goods_imageTitleSub1;
	}
	public String getGoods_imageTitleSub2() {
		return goods_imageTitleSub2;
	}
	public void setGoods_imageTitleSub2(String goods_imageTitleSub2) {
		this.goods_imageTitleSub2 = goods_imageTitleSub2;
	}
	public String getGoods_imageTitleSub3() {
		return goods_imageTitleSub3;
	}
	public void setGoods_imageTitleSub3(String goods_imageTitleSub3) {
		this.goods_imageTitleSub3 = goods_imageTitleSub3;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getGoods_index() {
		return goods_index;
	}
	public void setGoods_index(int goods_index) {
		this.goods_index = goods_index;
	}
	
}
