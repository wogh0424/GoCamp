package com.itbank.model;

import java.sql.Date;

public class CouponDTO {
	private int idx;
	private String cName;
	private String couponNum;
	private String userid;
	private double discnt;
	private int useava;
	private Date cDate;
	private Date dueDate;
	
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(String couponNum) {
		this.couponNum = couponNum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public double getDiscnt() {
		return discnt;
	}
	public void setDiscnt(double discnt) {
		this.discnt = discnt;
	}
	public int getUseava() {
		return useava;
	}
	public void setUseava(int useava) {
		this.useava = useava;
	}
	
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
}
