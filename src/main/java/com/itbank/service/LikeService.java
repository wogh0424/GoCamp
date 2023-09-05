package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ItemDTO;
import com.itbank.model.LikesDTO;
import com.itbank.repository.LikeDAO;

@Service
public class LikeService {
	
	@Autowired LikeDAO dao;

	public int saveLike(String gocamp, int member) {
		
		 LikesDTO like = new LikesDTO();
	        like.setMember(member);
	        like.setGocamp(gocamp);
	        
	        
		    return dao.insertLike(like);
	}

	public List<ItemDTO> selectLike(int member) {
		return dao.selectLike(member);
	}


	public int removeLike(String gocamp, int member) {
		 LikesDTO like = new LikesDTO();
		    like.setGocamp(gocamp);
		    like.setMember(member);
		    return dao.removeLike(like);
	}

	public boolean isLiked(String gocamp, int member) {
		LikesDTO like = new LikesDTO();
	    like.setGocamp(gocamp);
	    like.setMember(member);
	    int count = dao.isLiked(like);
	    return count > 0;
	}

	

	

	
	




}
