package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.FreeBoardDTO;
import com.itbank.model.PagingDTO;

@Repository
public interface FreeBoardDAO {

	int selectCount(HashMap<String, String> map);

	List<FreeBoardDTO> selectAll(PagingDTO paging);

	int updateViewCount(int idx);

	int insertBoard(FreeBoardDTO dto);

	FreeBoardDTO selectOne(int idx);

	int delete(int idx);

	int update(FreeBoardDTO dto);

}
