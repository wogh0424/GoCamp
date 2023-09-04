package com.itbank.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.CampDTO;
import com.itbank.model.ItemDTO;
import com.itbank.model.PageAndSearchDTO;
import com.itbank.model.SearchDTO;
import com.itbank.model.TagDTO;
import com.itbank.repository.CampDAO;

@Service
public class CampService {

	@Autowired
	private CampDAO campDAO;

	private File dir = new File("C:\\Users/ok/git/GoCamp/src/main/webapp/resources/upload/camp/");

	
	public int selectCnt(SearchDTO search) {
		if (search.getSearchTags() != null) {
			if (search.getSearchTags() != "") {
				List<String> tmp = Arrays.asList(search.getSearchTags().split(","));
				search.setTags(tmp);
			}
		}
		return campDAO.selectCnt(search);
	}

	public List<ItemDTO> selectAll(PageAndSearchDTO searchPage) {
		if (searchPage.getSearch().getSearchTags() != null) {
			if (searchPage.getSearch().getSearchTags() != "") {
				List<String> tmp = Arrays.asList(searchPage.getSearch().getSearchTags().split(","));
				searchPage.getSearch().setTags(tmp);
				campDAO.plusTagChooseCnt(tmp);
			}
		}
		return campDAO.selectAll(searchPage);
	}

	public String selectId(String contentId) {
		return campDAO.selectId(contentId);
	}

	public ItemDTO selectOne(String contentId) {
		return campDAO.selectOne(contentId);
	}

	public List<TagDTO> selectTags() {
		return campDAO.selectTags();
	}

	public int plusViewCount(String contentId) {
		return campDAO.plusViewCount(contentId);
	}

	public List<ItemDTO> searchByKeyWord(String srchKywrd) {
		return campDAO.searchByKeyWord(srchKywrd);
	}

	public int countByKeword(String srchKywrd) {
		return campDAO.countByKeyword(srchKywrd);
	}

	public int addcamp(CampDTO dto) {
		String ymd = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		String fileName = dto.getImageFile().getOriginalFilename();
		if (fileName.equals("")) {
			fileName = "https://gocamping.or.kr/img/2018/layout/noimg.jpg";
		}
		else {
			fileName = fileName.substring(0, fileName.lastIndexOf("."));   
			String ext = dto.getImageFile().getContentType().substring(dto.getImageFile().getContentType().indexOf("/") + 1);  
			fileName = fileName + "_" + ymd + "." + ext; 
			File dest = new File(dir, fileName);
			try {
				dto.getImageFile().transferTo(dest);
			} catch (Exception e) {}
			
		}
		dto.setFirstImageUrl(fileName);
		return campDAO.addcamp(dto);

	}

	public boolean cidDupCheck(String contentId) {
		return campDAO.cidDupCheck(contentId);
	}

	public List<String> getImageList(String contentId) {
		return campDAO.getImageList(contentId);
	}
}
