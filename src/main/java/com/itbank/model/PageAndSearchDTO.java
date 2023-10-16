package com.itbank.model;

public class PageAndSearchDTO {
	private MainPagingDTO page;
	private SearchDTO search;
	public PageAndSearchDTO(MainPagingDTO page, SearchDTO search) {
		this.page = page;
		this.search = search;
	}
	public MainPagingDTO getPage() {
		return page;
	}
	public void setPage(MainPagingDTO page) {
		this.page = page;
	}
	public SearchDTO getSearch() {
		return search;
	}
	public void setSearch(SearchDTO search) {
		this.search = search;
	}
}
