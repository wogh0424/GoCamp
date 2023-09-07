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

	List<GocampReviewDTO> selectAllReview(String contentId);

	String getnick(String userid);

	String getContentId(int idx);
	
	// review 게시판

	int selectCountGoCampAllReview(HashMap<String, String> map);

	List<GocampReviewDTO> GoCampAllReview(PagingDTO paging);

	GocampReviewDTO selectOneReview(int idx);

	List<GocampReviewDTO> searchByKeyword(String srchKywrd);

	int countByKeyword(String srchKywrd);


	// 추천순으로 화면에 띄울 리뷰
	List<GocampReviewDTO> selectMainReview();



	
	
}
