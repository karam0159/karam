package com.neating.member.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberVO {
	private int member_index;
	private String member_name;
	private String member_id;
	private String member_password;
	private String member_salt;
	private String member_address;
	private String member_tel;
	private String member_email;
	private Date member_birth;
	private String member_rank;
	private int member_gold;
	private int member_siteMoney;
	private String account_name;
	private String account_bank;
	private String account;
	private int sell_count;
	private Timestamp reg_date;
	
	public MemberVO()
	{
		
	}
	
	public MemberVO(String member_name, String member_id, String member_password)
	{
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_password = member_password;
	}
	public MemberVO(int member_index, String member_name, String member_id, String member_password,String member_salt, String member_address,
			String member_tel,String member_email, Date member_birth, String member_rank, int member_gold, int member_siteMoney,
			String account_name, String account_bank, String account, int sell_count, Timestamp reg_date)
	{
		this.member_index = member_index;
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_salt = member_salt;
		this.member_address = member_address;
		this.member_tel = member_tel;
		this.member_email = member_email;
		this.member_birth = member_birth;
		this.member_rank = member_rank;
		this.member_gold = member_gold;
		this.member_siteMoney = member_siteMoney;
		this.account_name = account_name;
		this.account_bank = account_bank;
		this.account = account;
		this.sell_count = sell_count;
		this.reg_date = reg_date;
	}
	
	
	public int getMember_index() {
		return member_index;
	}
	public void setMember_index(int member_index) {
		this.member_index = member_index;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_salt() {
		return member_salt;
	}
	public void setMember_salt(String member_salt) {
		this.member_salt = member_salt;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_rank() {
		return member_rank;
	}
	public void setMember_rank(String member_rank) {
		this.member_rank = member_rank;
	}
	public int getMember_gold() {
		return member_gold;
	}
	public void setMember_gold(int member_gold) {
		this.member_gold = member_gold;
	}
	public int getMember_siteMoney() {
		return member_siteMoney;
	}
	public void setMember_siteMoney(int member_siteMoney) {
		this.member_siteMoney = member_siteMoney;
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
	public int getSell_count() {
		return sell_count;
	}
	public void setSell_count(int sell_count) {
		this.sell_count = sell_count;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
