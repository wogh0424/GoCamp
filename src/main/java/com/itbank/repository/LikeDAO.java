package com.itbank.repository;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.itbank.model.ItemDTO;
import com.itbank.model.LikesDTO;

@Repository
public interface LikeDAO {

	



	List<ItemDTO> selectLike(int member);

	int insertLike(LikesDTO like);

	int isLiked(LikesDTO like);

	int removeLike(LikesDTO like);

	
	


	

	


}
