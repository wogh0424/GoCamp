package com.itbank.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.CampDTO;
import com.itbank.model.ImageDTO;
import com.itbank.model.ItemDTO;
import com.itbank.model.LikesDTO;
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
		String firstImage = dto.getImageFile().getOriginalFilename();
		if (firstImage.equals("")) {
			firstImage = "https://gocamping.or.kr/img/2018/layout/noimg.jpg";
		}
		else {
			firstImage = firstImage.substring(0, firstImage.lastIndexOf("."));   
			String ext = dto.getImageFile().getContentType().substring(dto.getImageFile().getContentType().indexOf("/") + 1);  
			firstImage = firstImage + "_" + ymd + "." + ext; 
			File dest = new File(dir, firstImage);
			try {
				dto.getImageFile().transferTo(dest);
			} catch (Exception e) {}
			
		}
		dto.setFirstImageUrl(firstImage);
		return campDAO.addcamp(dto);

	}

	public boolean cidDupCheck(String contentId) {
		return campDAO.cidDupCheck(contentId);
	}

	public List<String> getImageList(String contentId) {
		return campDAO.getImageList(contentId);
	}

	public int updatecamp(CampDTO dto) {
		int row = 0;
		
		// 만약 대표이미지 파일이 안들어왔으면 이전의 대표이미지로 dto에 세팅해준다.
		String d = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		String firstImage = dto.getImageFile().getOriginalFilename();
		if (firstImage.equals("")) {
			firstImage = campDAO.selectFirstImage(dto.getContentId());
		}
		else {
			firstImage = firstImage.substring(0, firstImage.lastIndexOf("."));   
			String ext = dto.getImageFile().getContentType().substring(dto.getImageFile().getContentType().indexOf("/") + 1);  
			firstImage = firstImage + "_" + d + "." + ext; 
			File dest = new File(dir, firstImage);
			try {
				dto.getImageFile().transferTo(dest);
			} catch (Exception e) {}
		}
		dto.setFirstImageUrl(firstImage);
		
		// 주변 풍경이미지들을 서버에 업로드한다.
		List<MultipartFile> uploadList =  dto.getFeatureImages();		
		for(MultipartFile file : uploadList) {				
			String fileName = file.getOriginalFilename();   
			String ymd = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
			if (fileName.equals("")) {
				continue;
			}
			else {
				ArrayList<String> fileNameList = new ArrayList<>();  // (파일 이름 추가할 수 있는) 비어있는 문자열 리스트  (0)
				fileName = fileName.substring(0, fileName.lastIndexOf("."));   // a (마지막 index는 포함되지 않으니 a만 남는다,)
				
				String ext = file.getContentType().substring(file.getContentType().indexOf("/") + 1);   // image/jpeg 이면 jpeg만 남으므로  a_20230704140453.jpeg  이렇게 표현
				File dest = new File(dir, fileName + "_" + ymd + "." + ext);
				fileNameList.add(dest.getName());							 // 0 > 1 > 2 (size)
				try {
					file.transferTo(dest);  // f를 dest에 복사
				} catch (Exception e) {}				
				
				HashMap<String, Object> param = new HashMap<>();
				param.put("contentId", dto.getContentId());   
				param.put("list", fileNameList);
				
				row += campDAO.insertImages(param);
			}
		}
		
		row += campDAO.updatecamp(dto);
		return row;
	}

	public boolean deleteImageItem(ImageDTO imageInfo) {
		return campDAO.deleteImageItem(imageInfo);
	}

	public int deletecamp(String contentId) {
		List<String> fileList = campDAO.getImageList(contentId);
		for (String fileName : fileList) {
			File file = new File(dir, fileName);
			if (file.exists()) {
				file.delete();
			}
		}
		// 지울 때 따로 저장되었던 대표이미지도 같이 삭제한다.
		String firstImage = campDAO.selectFirstImage(contentId);
		File file = new File(dir, firstImage);
		if (file.exists()) {
			file.delete();
		}
		
		int row = 0;
		row += campDAO.deleteFile(contentId);
		row += campDAO.deletecamp(contentId);
		return row;
	}
<<<<<<< HEAD
	
	// 검색어 자동완성
	public List<String> autocompletion(SearchDTO dto) {
		return campDAO.autocompletion(dto);
	}
=======

>>>>>>> b8dce030271e0338fa804420a36c6d8a8d560c79
}
