package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.GocampReviewDTO;
import com.itbank.model.PagingDTO;

@Repository
public interface GocampReviewDAO {



	int insertUpload(GocampReviewDTO dto);

	int selectMaxIdxFromUpload();

	int insertFile(HashMap<String, Object> param);

	List<String> selectFileList(int idx);

	int deleteFile(int idx);

	int deleteReview(int idx);

	List<GocampReviewDTO> selectAllReview();

//	List<GocampReviewDTO> getReview(String contentId);
//
//	String writeReview(GocampReviewDTO review);

}
