package com.itbank.repository;

import java.util.List;

import com.itbank.model.ItemDTO;
import com.itbank.model.PageAndSearchDTO;
import com.itbank.model.SearchDTO;

public interface CampDAO {

	List<ItemDTO> selectAll(PageAndSearchDTO searchPage);

	int selectCnt(SearchDTO search);

	String selectId(String contentId);
	
}
