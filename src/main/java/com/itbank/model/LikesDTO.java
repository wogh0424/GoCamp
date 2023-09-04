package com.itbank.model;

public class LikesDTO {
	
//		member 		INT PRIMARY KEY not null,
//	    gocamp 		varchar(100),
//	    review 		INT,
	
	private int member;
	private String gocamp;
	private int review;
	
	
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public String getGocamp() {
		return gocamp;
	}
	public void setGocamp(String gocamp) {
		this.gocamp = gocamp;
	}
	public int getReview() {
		return review;
	}
	public void setReview(int review) {
		this.review = review;
	}
	
	
	
	

}
