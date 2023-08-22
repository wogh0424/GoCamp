package com.itbank.model;

import java.sql.Date;

public class EventBoardDTO {
	
//	idx 	int 	auto_increment primary key,
//	title	varchar(200)	not null,
//	content	varchar(2000)	not null,
//	postdate	datetime   default now(),
//  view_cnt int default 0
	
	private int idx;
	private String title;
	private String content;
	private Date postdate;
	private int view_cnt;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	
	

}
