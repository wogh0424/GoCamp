package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.FreeBoardDTO;
import com.itbank.model.PagingDTO;

@Repository
public interface FreeBoardDAO {

	int selectCount(HashMap<String, String> map);

	List<FreeBoardDTO> selectAll(PagingDTO paging);

	int updateViewCount(int idx);

	int insertBoard(FreeBoardDTO dto);

	// 게시글 조회 view/${idx}
	FreeBoardDTO selectOne(int idx);

	int deleteFreeBoard(int idx);

	int update(FreeBoardDTO dto);

	String getnick(String userid);

	int ViewCount(int idx);

	List<FreeBoardDTO> selectFile();

	int insertFile(HashMap<String, Object> param);

	int selectMaxIdxFromUpload();

	int deleteFile(int idx);

	List<String> selectFileList(int idx);

	int replyCount(int idx);

//	List<MultipartFile> selectUpload(int idx);

}
