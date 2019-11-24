package com.neating.goods.vo;

import java.sql.Timestamp;

public class GoodsVO {
	private int goods_index;
	private String goods_class;
	private String goods_name;
	private String goods_kind;
	private String goods_imageTitle;
	private int goods_countS;
	private int goods_countM;
	private int goods_countL;
	private int goods_price;
	private int goods_sale;
	private int goods_lastprice;
	private String goods_content;
	private int goods_sellcount;
	private int readcount;
	private Timestamp reg_date;
	
	public GoodsVO()
	{
		
	}
	
	public GoodsVO(int goods_index, String goods_class,String goods_name,String goods_kind,
			String goods_imageTitle,int goods_countS,int goods_countM,int goods_countL,
			int goods_price,int goods_sale,int goods_lastprice,String goods_content,int goods_sellcount,int readcount,Timestamp reg_date)
	{
		this.goods_index = goods_index;
		this.goods_class = goods_class;
		this.goods_name = goods_name;
		this.goods_kind = goods_kind;
		this.goods_imageTitle = goods_imageTitle;
		this.goods_countS = goods_countS;
		this.goods_countM = goods_countM;
		this.goods_countL = goods_countL;
		this.goods_price = goods_price;
		this.goods_sale = goods_sale;
		this.goods_lastprice = goods_lastprice;
		this.goods_content = goods_content;
		this.goods_sellcount = goods_sellcount;
		this.readcount = readcount;
		this.reg_date = reg_date;
		
	}
	
	public String getGoods_imageTitle() {
		return goods_imageTitle;
	}

	public void setGoods_imageTitle(String goods_imageTitle) {
		this.goods_imageTitle = goods_imageTitle;
	}

	public int getGoods_index() {
		return goods_index;
	}
	public void setGoods_index(int goods_index) {
		this.goods_index = goods_index;
	}
	public String getGoods_class() {
		return goods_class;
	}
	public void setGoods_class(String goods_class) {
		this.goods_class = goods_class;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_kind() {
		return goods_kind;
	}
	public void setGoods_kind(String goods_kind) {
		this.goods_kind = goods_kind;
	}
	public int getGoods_countS() {
		return goods_countS;
	}
	public void setGoods_countS(int goods_countS) {
		this.goods_countS = goods_countS;
	}
	public int getGoods_countM() {
		return goods_countM;
	}
	public void setGoods_countM(int goods_countM) {
		this.goods_countM = goods_countM;
	}
	public int getGoods_countL() {
		return goods_countL;
	}
	public void setGoods_countL(int goods_countL) {
		this.goods_countL = goods_countL;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_sale() {
		return goods_sale;
	}
	public void setGoods_sale(int goods_sale) {
		this.goods_sale = goods_sale;
	}
	public int getGoods_lastprice() {
		return goods_lastprice;
	}
	public void setGoods_lastprice(int goods_lastprice) {
		this.goods_lastprice = goods_lastprice;
	}
	public String getGoods_content() {
		return goods_content;
	}
	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}
	public int getGoods_sellcount() {
		return goods_sellcount;
	}
	public void setGoods_sellcount(int goods_sellcount) {
		this.goods_sellcount = goods_sellcount;
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
	
}
