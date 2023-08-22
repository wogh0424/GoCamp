package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ItemDTO;
import com.itbank.model.PageAndSearchDTO;
import com.itbank.model.SearchDTO;
import com.itbank.repository.CampDAO;

@Service
public class CampService {

	@Autowired private CampDAO campDAO;
	
	public int selectCnt(SearchDTO search) {
		return campDAO.selectCnt(search);
	}
	
	public List<ItemDTO> selectAll(PageAndSearchDTO searchPage) {
		return campDAO.selectAll(searchPage);
	}

	public String selectId(String contentId) {	
		return campDAO.selectId(contentId);
	}
	
}
