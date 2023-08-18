package com.itbank.model;

public class PageAndSearchDTO {
	private PagingDTO page;
	private SearchDTO search;
	public PageAndSearchDTO(PagingDTO page, SearchDTO search) {
		this.page = page;
		this.search = search;
	}
	public PagingDTO getPage() {
		return page;
	}
	public void setPage(PagingDTO page) {
		this.page = page;
	}
	public SearchDTO getSearch() {
		return search;
	}
	public void setSearch(SearchDTO search) {
		this.search = search;
	}
}
