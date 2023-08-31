package com.itbank.model;

public class PagingDTO {

	private int page;			// 사용자가 요청한 페이지 번호
	private int offset;			// idx역순으로 정렬했을 때 시작지점에서 건너뛰는 개수
	private int perPage = 10;
	private int boardCount;		// 총 게시글의 개수(select count(*) from board2 where ${column} like '%${search}%')
	private int pageCount;
	private String order;
	private String search;
	private String column;
	
	private int perSection = 10;	// 쪽번호 개수
	private int begin;				// 쪽번호 시작값
	private int end;				// 쪽번호 끝값
	private int section;
	private boolean prev;
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	private boolean next;
	
	public PagingDTO(int page, int boardCount, String order) {
		this.page = page;
		this.boardCount = boardCount;
		this.order = order;
		pageCount = boardCount / perPage;
		pageCount += (boardCount % perPage != 0) ? 1 : 0;
		
		if(page > pageCount) {	// 요청페이지가 최대수를 초과하면
			page = pageCount;	// 페이지 개수(마지막 페이지)를 대입
			this.page = page;	// 파라미터를 멤버 필드에 대입
		}
		if (page == 0) page = 1;
		offset = (page - 1) * perPage;
		
		end = ((page - 1) / perSection + 1) * perSection;
		begin = end - perSection + 1;
		
		section = (end - 1) / 10;
		prev = section != 0;
		
		end = end > pageCount ? pageCount : end;
		next = end != pageCount;
	}

	public PagingDTO(int page, int boardCount, String search, String column) {
		this.page = page;
		this.boardCount = boardCount;
		this.search = search;
		this.column = column;
		pageCount = boardCount / perPage;
		pageCount += (boardCount % perPage != 0) ? 1 : 0;
		
		if(page > pageCount) {	// 요청페이지가 최대수를 초과하면
			page = pageCount;	// 페이지 개수(마지막 페이지)를 대입
			this.page = page;	// 파라미터를 멤버 필드에 대입
		}
		offset = (page - 1) * perPage;
		if (offset < 0) offset = 0;
		
		end = ((page - 1) / perSection + 1) * perSection;
		begin = end - perSection + 1;
		section = (end - 1) / 10;
		prev = section != 0;
		
		end = end > pageCount ? pageCount : end;
		next = end != pageCount;
	}
	
	public PagingDTO(int page, int boardCount) {
		this.page = page;
		this.boardCount = boardCount;
		pageCount = boardCount / perPage;
		pageCount += (boardCount % perPage != 0) ? 1 : 0;
		
		if(page > pageCount) {	// 요청페이지가 최대수를 초과하면
			page = pageCount;	// 페이지 개수(마지막 페이지)를 대입
			this.page = page;	// 파라미터를 멤버 필드에 대입
		}
		offset = (page - 1) * perPage;
		if (offset < 0) offset = 0;
		
		end = ((page - 1) / perSection + 1) * perSection;
		begin = end - perSection + 1;
		section = (end - 1) / 10;
		prev = section != 0;
		
		end = end > pageCount ? pageCount : end;
		next = end != pageCount;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public int getPerSection() {
		return perSection;
	}

	public void setPerSection(int perSection) {
		this.perSection = perSection;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	 
}
