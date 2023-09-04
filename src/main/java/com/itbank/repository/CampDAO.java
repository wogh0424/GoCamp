package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import com.itbank.model.CampDTO;
import com.itbank.model.ImageDTO;
import com.itbank.model.ItemDTO;
import com.itbank.model.PageAndSearchDTO;
import com.itbank.model.SearchDTO;
import com.itbank.model.TagDTO;

public interface CampDAO {

	List<ItemDTO> selectAll(PageAndSearchDTO searchPage);

	int selectCnt(SearchDTO search);

	String selectId(String contentId);

	ItemDTO selectOne(String contentId);

	List<TagDTO> selectTags();

	int plusViewCount(String contentId);

	int plusTagChooseCnt(List<String> tags);

	List<ItemDTO> searchByKeyWord(String srchKywrd);

	int countByKeyword(String srchKywrd);

	int addcamp(CampDTO dto);

	boolean cidDupCheck(String contentId);

	List<String> getImageList(String contentId);

	boolean deleteImageItem(ImageDTO imageInfo);

	String selectFirstImage(String contentId);

	int insertImages(HashMap<String, Object> param);

	int updatecamp(CampDTO dto);

	int deleteFile(String contentId);

	int deletecamp(String contentId);


}
