package com.itbank.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FreeBoardDTO {
	
//	  	idx 		int auto_increment primary key,
//	    title 		varchar(1000) not null,
//	    writer 		varchar(100) ,
//	    content 	varchar(2000),
//	    filePath 	varchar(255),
//	    view_cnt    int default 0,
//	    date 		datetime default now(),
//	 
//		CONSTRAINT free_user_fk FOREIGN KEY (writer) REFERENCES member(nickname)
	
	private int idx;
	private String title;
	private String writer;
	private String content;
	
	private String filePath;
	private List<MultipartFile> upload = null;
	
	private int view_cnt;
	private Date date;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
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
	
	
	

}
