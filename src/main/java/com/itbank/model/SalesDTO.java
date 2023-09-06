package com.itbank.model;

import java.sql.Date;

public class SalesDTO {

    private int 서울시;
    private int 부산시;
    private int 대구시;
    private int 인천시;
    private int 광주시;
    private int 대전시;
    private int 울산시;
    private int 세종시;
    private int 제주도;
    private Date searchedDate;
    private String formattedDate;
    
    
    
	public String getFormattedDate() {
		return formattedDate;
	}
	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}
	public int get서울시() {
		return 서울시;
	}
	public void set서울시(int 서울시) {
		this.서울시 = 서울시;
	}
	public int get부산시() {
		return 부산시;
	}
	public void set부산시(int 부산시) {
		this.부산시 = 부산시;
	}
	public int get대구시() {
		return 대구시;
	}
	public void set대구시(int 대구시) {
		this.대구시 = 대구시;
	}
	public int get인천시() {
		return 인천시;
	}
	public void set인천시(int 인천시) {
		this.인천시 = 인천시;
	}
	public int get광주시() {
		return 광주시;
	}
	public void set광주시(int 광주시) {
		this.광주시 = 광주시;
	}
	public int get대전시() {
		return 대전시;
	}
	public void set대전시(int 대전시) {
		this.대전시 = 대전시;
	}
	public int get울산시() {
		return 울산시;
	}
	public void set울산시(int 울산시) {
		this.울산시 = 울산시;
	}
	public int get세종시() {
		return 세종시;
	}
	public void set세종시(int 세종시) {
		this.세종시 = 세종시;
	}
	public int get제주도() {
		return 제주도;
	}
	public void set제주도(int 제주도) {
		this.제주도 = 제주도;
	}
	public Date getSearchedDate() {
		return searchedDate;
	}
	public void setSearchedDate(Date searchedDate) {
		this.searchedDate = searchedDate;
	}
    
    
	
	
	
}
