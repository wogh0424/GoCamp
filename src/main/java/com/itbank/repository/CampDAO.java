package com.itbank.repository;

import java.util.List;

import com.itbank.model.ItemDTO;
import com.itbank.model.PageAndSearchDTO;
import com.itbank.model.SearchDTO;
import com.itbank.model.TagDTO;

public interface CampDAO {

	List<ItemDTO> selectAll(PageAndSearchDTO searchPage);

	int selectCnt(SearchDTO search);

	String selectId(String contentId);

	ItemDTO selectOne(String contentId);

	List<TagDTO> selectTags();

	int plusViewCount(String contentId);

	int plusTagChooseCnt(List<String> tags);

	List<ItemDTO> searchByKeyWord(String srchKywrd);

	
}
