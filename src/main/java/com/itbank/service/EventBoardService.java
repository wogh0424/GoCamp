package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.EventBoardDTO;
import com.itbank.model.PagingDTO;
import com.itbank.repository.EventBoardDAO;

@Service
public class EventBoardService {

	@Autowired private EventBoardDAO dao;
	
	
	public int selectCount(HashMap<String, String> map) {
		return dao.selectCount(map);
	}


	public List<EventBoardDTO> selectAll(PagingDTO paging) {
		return dao.selectAll(paging);
	}


	public EventBoardDTO selectOne(int idx) {
		dao.updateViewCount(idx);
		return dao.selectOne(idx);
	}

}
