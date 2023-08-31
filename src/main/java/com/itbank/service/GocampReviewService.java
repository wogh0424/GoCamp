package com.itbank.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.GocampReviewDTO;
import com.itbank.repository.GocampReviewDAO;

@Service
public class GocampReviewService {

	@Autowired private GocampReviewDAO dao;

	private File dir = new File("C:\\Users/yeonji/git/GoCamp/src/main/webapp/resources/image");
	
	// directory 없으면 만들어라
	public GocampReviewService() {
			if(dir.exists() == false) {
				dir.mkdirs();
			}
	}
	


	
	@Transactional
	public int insert(GocampReviewDTO dto) {

		
		List<MultipartFile> uploadList =  dto.getUpload();		// 첨부파일의 목록  (2)
		ArrayList<String> fileNameList = new ArrayList<>();  // (파일 이름 추가할 수 있는) 비어있는 문자열 리스트  (0)
		
		for(MultipartFile f : uploadList) {				// 2회 반복
		String ymd = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		String fileName = f.getOriginalFilename();   // a.jpg
		fileName = fileName.substring(0, fileName.lastIndexOf("."));   // a (마지막 index는 포함되지 않으니 a만 남는다,)
		String ext = f.getContentType().substring(f.getContentType().indexOf("/") + 1);   // image/jpeg 이면 jpeg만 남으므로  a_20230704140453.jpeg  이렇게 표현

		File dest = new File(dir, fileName + "_" + ymd + "." + ext);
			fileNameList.add(dest.getName());							 // 0 > 1 > 2 (size)
			try {
				f.transferTo(dest);  // f를 dest에 복사
			} catch (Exception e) {}
		}
//		dto.setFilePath(fileNameList);					// 길이 2짜리 리스트를 dto에 set
		
		int row = 0;
		
		row += dao.insertUpload(dto);
		int fk = dao.selectMaxIdxFromUpload(); // 외래키 불러오기 , 가장 높은 idx 불러오기(마지막에 넣은 값)
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("upload", fk);   // 마지막 넣은 글의 idx를 추가한다.
		param.put("list", fileNameList);
		
		row += dao.insertFile(param);
		
		return row;
	}

	public List<GocampReviewDTO> selectAllReview() {
		return dao.selectAllReview();
	}
	

	public int deleteReview(int idx) {
		List<String> fileList = dao.selectFileList(idx);  	// 삭제할 파일 목록을 select로 가져 와야해
		for(String fileName : fileList) {
			File f = new File(dir, fileName);				// 저장된 위치에 지정한 이름의 파일
			if(f.exists()) {					// 파일이 있으면
				f.delete();					// 파일을 삭제한다.
			}
		}
		
		int row = 0;
		row += dao.deleteFile(idx);   // DB에서 파일이름을 먼저 삭제하고(자식테이블)
		row += dao.deleteReview(idx);		// 참조하는 자식 테이블 레코드가 없으면 부모테이블 삭제
													// on delete cascade  걸려있으면 row += dao.delete(idx);	 만 하면된다.
		
		return row;
	}



	// 통합검색용 쿼리
	public List<GocampReviewDTO> searchByKeyWord(String srchKywrd) {
		return dao.searchByKeyword(srchKywrd);
	}


	
//	public int selectCount() {
//		return dao.selectCount();
//	}
//
//	public List<GocampReviewDTO> selectAll(PagingDTO paging) {
//		return dao.selectAll(paging);
//	}
//
//	public int write(GocampReviewDTO dto) {
//		return dao.insert(dto);
//	}

	

//	public List<GocampReviewDTO> getReview(String contentId) {
//		return dao.getReview(contentId);
//	}

//	public String writeReview(GocampReviewDTO review) {
//		return dao.writeReview(review);
//	}

}


