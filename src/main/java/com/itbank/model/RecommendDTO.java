package com.itbank.model;

public class RecommendDTO {

//	member 		INT PRIMARY KEY not null,
//    gocamp 		varchar(100),
//    review 		INT,
//    status		int	default 0,
	
	private int member;
	private String gocamp;
	private int review;
	private int recommendCampCnt;
	private int recommendReviewCnt;
	
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
	public int getRecommendCampCnt() {
		return recommendCampCnt;
	}
	public void setRecommendCampCnt(int recommendCampCnt) {
		this.recommendCampCnt = recommendCampCnt;
	}
	public int getRecommendReviewCnt() {
		return recommendReviewCnt;
	}
	public void setRecommendReviewCnt(int recommendReviewCnt) {
		this.recommendReviewCnt = recommendReviewCnt;
	}
	
	
	
	
}
