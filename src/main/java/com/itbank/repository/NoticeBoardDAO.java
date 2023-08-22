package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.NoticeBoardDTO;
import com.itbank.model.PagingDTO;

@Repository
public interface NoticeBoardDAO {

	int selectCount(HashMap<String, String> map);

	List<NoticeBoardDTO> selectAll(PagingDTO paging);

	NoticeBoardDTO selectOne(int idx);

	int updateViewCount(int idx);

}
