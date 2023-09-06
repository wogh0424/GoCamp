package com.itbank.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	   private int idx;
	   private String pName;
	   private int price;
	   private int amount;
	   private int views;
	   private String pCategory;
	   private String pContent;
	   private Date sDate;
	   private int pick;
	   private String image;
<<<<<<< HEAD
	   private List<MultipartFile> upload;
	   private int userid;
=======
	   private String userid;
>>>>>>> 01cdba27456be5c3dd472d5cfc67b23ce895ecd8
	   private int pStar;
	   
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	public int getPick() {
		return pick;
	}
	public void setPick(int pick) {
		this.pick = pick;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
<<<<<<< HEAD
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	public int getUserid() {
=======
	public String getUserid() {
>>>>>>> 01cdba27456be5c3dd472d5cfc67b23ce895ecd8
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getpStar() {
		return pStar;
	}
	public void setpStar(int pStar) {
		this.pStar = pStar;
	}
	public void setthumbnailUrl(String firstImage) {
		// TODO Auto-generated method stub
		
	}
	   
}