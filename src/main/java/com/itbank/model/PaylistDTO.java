package com.itbank.model;

public class PaylistDTO {
	private int idx;
	private String userid;
	private int totalOrderPrice;
	private int totalOederAmount;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getTotalOrderPrice() {
		return totalOrderPrice;
	}
	public void setTotalOrderPrice(int totalOrderPrice) {
		this.totalOrderPrice = totalOrderPrice;
	}
	public int getTotalOederAmount() {
		return totalOederAmount;
	}
	public void setTotalOederAmount(int totalOederAmount) {
		this.totalOederAmount = totalOederAmount;
	}
	
	
}
