package com.itbank.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ItemDTO;
import com.itbank.model.LikesDTO;
import com.itbank.model.PageAndSearchDTO;
import com.itbank.model.SearchDTO;
import com.itbank.model.TagDTO;
import com.itbank.repository.CampDAO;

@Service
public class CampService {

	@Autowired private CampDAO campDAO;
	
	public int selectCnt(SearchDTO search) {
		if (search.getSearchTags() != null) {
			if (search.getSearchTags() != "") {
				List<String> tmp = Arrays.asList(search.getSearchTags().split(","));
				search.setTags(tmp);
			}
		}
		return campDAO.selectCnt(search);
	}
	
	public List<ItemDTO> selectAll(PageAndSearchDTO searchPage) {
		if (searchPage.getSearch().getSearchTags() != null) {
			if (searchPage.getSearch().getSearchTags() != "") {
				List<String> tmp = Arrays.asList(searchPage.getSearch().getSearchTags().split(","));
				searchPage.getSearch().setTags(tmp);
				campDAO.plusTagChooseCnt(tmp);				
			}
		}
		return campDAO.selectAll(searchPage);
	}

	public String selectId(String contentId) {
		return campDAO.selectId(contentId);
	}

	public ItemDTO selectOne(String contentId) {
		return campDAO.selectOne(contentId);
	}

	public List<TagDTO> selectTags() {
		return campDAO.selectTags();
	}

	public int plusViewCount(String contentId) {
		return campDAO.plusViewCount(contentId);
	}

	public List<ItemDTO> searchByKeyWord(String srchKywrd) {
		return campDAO.searchByKeyWord(srchKywrd);
	}

	public int countByKeword(String srchKywrd) {
		return campDAO.countByKeyword(srchKywrd);
	}

	
	
}
