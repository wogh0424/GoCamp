package com.itbank.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class GocampReviewDTO {
	
//	idx 			int		 auto_increment primary key,
//	gocamp_board 	varchar(100)    not null,  
//	title    		varchar(200)	not null,
//	writer			varchar(100)	not null,
//	filePath		varchar(255),
//	view_cnt		int				default 0,
//	reviewdate		datetime		default now(),
//	
//	constraint review_gocamp_fk foreign key (gocamp_board) references gocamp(contentId),
//	constraint review_member_fk foreign key (writer) references member(nickname)
	
	private int idx;
	private String gocamp_board;
	private String title;
	private String writer;
	private String filePath;
	private String review_content;
	
	private List<MultipartFile> upload;
	
	private int view_cnt;
	private Date reviewdate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getGocamp_board() {
		return gocamp_board;
	}
	public void setGocamp_board(String gocamp_board) {
		this.gocamp_board = gocamp_board;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public Date getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(Date reviewdate) {
		this.reviewdate = reviewdate;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	
	

}
