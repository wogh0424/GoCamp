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
	
	int insertBoard(EventBoardDTO dto);

	int delete(int idx);

	int update(EventBoardDTO dto);

	int selectMaxIdxFromUpload();

	int insertFile(HashMap<String, Object> param);

	List<String> selectFileList(int idx);

	int deleteFile(String filePath);

	List<EventBoardDTO> searchByKeyWord(String srchKywrd);

	int countByKeyword(String srchKywrd);

}
