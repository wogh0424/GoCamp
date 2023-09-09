package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itbank.model.RecommendDTO;
import com.itbank.repository.RecommendDAO;

@Service
public class RecommendService {
	
	@Autowired private RecommendDAO dao;

	
	// 캠핑장 
	
	@Transactional
	public int insertRecommend(String gocamp, int member) {
	    RecommendDTO recommend = new RecommendDTO();
	    recommend.setMember(member);
	    recommend.setGocamp(gocamp);

	    int result = dao.insertRecommend(recommend);

	    if (result > 0) {
	        dao.increaseRecommendCount(gocamp);
	    }

	    return result;
	}

	@Transactional
	public int increaseRecommendCount(String gocamp) {
	    return dao.increaseRecommendCount(gocamp);
	}

	
	@Transactional
	public int deleteRecommend(String gocamp, int member) {
		RecommendDTO recommend = new RecommendDTO();
		recommend.setMember(member);
		recommend.setGocamp(gocamp);
		
		int result = dao.deleteRecommend(recommend);

	    if (result > 0) {
	        dao.decreaseRecommendCount(gocamp);
	    }

	    return result;
	}
	
	@Transactional
	public int decreaseRecommendCount(String gocamp) {
	    return dao.decreaseRecommendCount(gocamp);
	}

	// 추천 된 상태, count가 1 일 때
	public boolean isCampRecommended(String gocamp, int member) {
		RecommendDTO recommend = new RecommendDTO();
			recommend.setMember(member);
			recommend.setGocamp(gocamp);
			int count = dao.isCampRecommended(recommend);
		return count > 0;
	}


	// 캠핑장 추천수 + 1 
	public int getCampRecommendCount(String gocamp) {
		return dao.getCampRecommendCount(gocamp);
	}
	
	
	// 캠핑장 리뷰 


	
	@Transactional
	public int insertReviewRecommend(int review, int member) {
	    RecommendDTO recommend = new RecommendDTO();
	    recommend.setMember(member);
	    recommend.setReview(review);

	    int result = dao.insertReviewRecommend(recommend);

	    if (result > 0) {
	        dao.increaseReviewRecommendCount(review);
	    }

	    return result;
	}

	@Transactional
	public int increaseReviewRecommendCount(int review) {
	    return dao.increaseReviewRecommendCount(review);
	}

	
	@Transactional
	public int deleteReviewRecommend(int review, int member) {
		RecommendDTO recommend = new RecommendDTO();
		recommend.setMember(member);
		recommend.setReview(review);
		
		int result = dao.deleteReviewRecommend(recommend);

	    if (result > 0) {
	        dao.decreaseReviewRecommendCount(review);
	    }

	    return result;
	}
	
	@Transactional
	public int decreaseReviewRecommendCount(int review) {
	    return dao.decreaseReviewRecommendCount(review);
	}

	// 추천 된 상태, count가 1 일 때
	public boolean isReviewRecommended(int review, int member) {
		RecommendDTO recommend = new RecommendDTO();
			recommend.setMember(member);
			recommend.setReview(review);
			int count = dao.isReviewRecommended(recommend);
		return count > 0;
	}


	// 캠핑장 추천수 + 1 
	public int getReviewRecommendCount(int review) {
		return dao.getReviewRecommendCount(review);
	}

	

	
	

	
	
	
}


