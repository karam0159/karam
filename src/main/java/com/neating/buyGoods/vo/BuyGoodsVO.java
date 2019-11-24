package com.neating.buyGoods.vo;

import java.sql.Timestamp;

public class BuyGoodsVO {
	private int buy_index;
	private String member_id;
	private String member_name;
	private String member_tel;
	private String member_address;
	private String del_name;
	private String del_tel;
	private String del_address;
	private String del_request;
	private String del_state;
	private int goods_index;
	private String goods_name;
	private String goods_kind;
	private String goods_imageTitle;
	private int goods_countS;
	private int goods_countM;
	private int goods_countL;
	private int goods_price;
	private int member_usesitemoney;
	private int goods_allprice;
	private int del_price;
	private int goods_lastprice;
	private String account_name;
	private String account_bank;
	private String account;
	private Timestamp reg_date;
	private Timestamp end_time;
	
	public BuyGoodsVO() {};
	public BuyGoodsVO(int buy_index, String member_id,String member_name,String member_tel, 
			String member_address,String del_name, String del_tel,String del_address, String del_request,
			String del_state,int goods_index,String goods_name,String goods_kind,String goods_imageTitle,int goods_countS,int goods_countM,int goods_countL,
			int goods_price,int member_usesitemoney,int goods_allprice,int del_price,int goods_lastprice,
			String account_name,String account_bank,String account,Timestamp reg_date,Timestamp end_time)
	{
		this.buy_index = buy_index;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_tel = member_tel;
		this.member_address = member_address;
		this.del_name = del_name;
		this.del_tel = del_tel;
		this.del_address = del_address;
		this.del_request = del_request;
		this.del_state = del_state;
		this.goods_index = goods_index;
		this.goods_name = goods_name;
		this.goods_kind = goods_kind;
		this.goods_imageTitle = goods_imageTitle;
		this.goods_countS = goods_countS;
		this.goods_countM = goods_countM;
		this.goods_countL = goods_countL;
		this.goods_price = goods_price;
		this.member_usesitemoney = member_usesitemoney;
		this.goods_allprice = goods_allprice;
		this.del_price = del_price;
		this.goods_lastprice = goods_lastprice;
		this.account_name = account_name;
		this.account_bank = account_bank;
		this.account = account;
		this.reg_date = reg_date;
		this.end_time = end_time;
	}
	
	public int getBuy_index() {
		return buy_index;
	}
	public void setBuy_index(int buy_index) {
		this.buy_index = buy_index;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getDel_name() {
		return del_name;
	}
	public void setDel_name(String del_name) {
		this.del_name = del_name;
	}
	public String getDel_tel() {
		return del_tel;
	}
	public void setDel_tel(String del_tel) {
		this.del_tel = del_tel;
	}
	public String getDel_address() {
		return del_address;
	}
	public void setDel_address(String del_address) {
		this.del_address = del_address;
	}
	public String getDel_request() {
		return del_request;
	}
	public void setDel_request(String del_request) {
		this.del_request = del_request;
	}
	public String getDel_state() {
		return del_state;
	}
	public void setDel_state(String del_state) {
		this.del_state = del_state;
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
	public String getGoods_kind() {
		return goods_kind;
	}
	public void setGoods_kind(String goods_kind) {
		this.goods_kind = goods_kind;
	}
	public String getGoods_imageTitle() {
		return goods_imageTitle;
	}
	public void setGoods_imageTitle(String goods_imageTitle) {
		this.goods_imageTitle = goods_imageTitle;
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
	public int getMember_usesitemoney() {
		return member_usesitemoney;
	}
	public void setMember_usesitemoney(int member_usesitemoney) {
		this.member_usesitemoney = member_usesitemoney;
	}
	public int getGoods_allprice() {
		return goods_allprice;
	}
	public void setGoods_allprice(int goods_allprice) {
		this.goods_allprice = goods_allprice;
	}
	public int getDel_price() {
		return del_price;
	}
	public void setDel_price(int del_price) {
		this.del_price = del_price;
	}
	public int getGoods_lastprice() {
		return goods_lastprice;
	}
	public void setGoods_lastprice(int goods_lastprice) {
		this.goods_lastprice = goods_lastprice;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public String getAccount_bank() {
		return account_bank;
	}
	public void setAccount_bank(String account_bank) {
		this.account_bank = account_bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}
}
