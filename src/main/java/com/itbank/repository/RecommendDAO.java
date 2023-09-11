package com.itbank.repository;

import org.springframework.stereotype.Repository;

import com.itbank.model.RecommendDTO;

@Repository
public interface RecommendDAO {


	

	// 캠핑장 추천

	int insertRecommend(RecommendDTO recommend);

	int deleteRecommend(RecommendDTO recommend);

	int isCampRecommended(RecommendDTO recommend);

	int increaseRecommendCount(String gocamp);

	int getCampRecommendCount(String gocamp);

	int decreaseRecommendCount(String gocamp);


	// 캠핑장리뷰추천

	int insertReviewRecommend(RecommendDTO recommend);

	int deleteReviewRecommend(RecommendDTO recommend);
	
	int decreaseReviewRecommendCount(int review);
	
	int increaseReviewRecommendCount(int review);
	
	int isReviewRecommended(RecommendDTO recommend);

	
	
	int getReviewRecommendCount(int review);




	

	

	
	

}
