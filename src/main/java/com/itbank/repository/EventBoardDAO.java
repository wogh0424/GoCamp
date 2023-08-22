package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.EventBoardDTO;
import com.itbank.model.PagingDTO;

@Repository
public interface EventBoardDAO {

	int selectCount(HashMap<String, String> map);

	List<EventBoardDTO> selectAll(PagingDTO paging);

	EventBoardDTO selectOne(int idx);

	int updateViewCount(int idx);

}
