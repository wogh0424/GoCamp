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
import com.itbank.model.PagingDTO;
import com.itbank.repository.GocampReviewDAO;

@Service
public class GocampReviewService {

	@Autowired private GocampReviewDAO dao;

	private File dir = new File("/usr/local/tomcat/webapps/upload");

	
	// directory 없으면 만들어라
	public GocampReviewService() {
			if(dir.exists() == false) {
				dir.mkdirs();
			}
	}
	
	@Transactional
	public int insert(GocampReviewDTO dto) {
		int row = 0;
		
		System.out.println("파일 경로 : " + dto.getFilePath());
		row += dao.insertUpload(dto);
		System.err.println("uploadsize : " + dto.getUpload().get(0).getOriginalFilename());

		List<MultipartFile> uploadList =  dto.getUpload();		// 첨부파일의 목록  (2)
		
		for(MultipartFile file : uploadList) {				// 2회 반복
			String ymd = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
			String fileName = file.getOriginalFilename();   // a.jpg
			if (fileName.equals("")) {
				continue;
			}
			else {
				ArrayList<String> fileNameList = new ArrayList<>();
				fileName = fileName.substring(0, fileName.lastIndexOf("."));   // a (마지막 index는 포함되지 않으니 a만 남는다,)
				
				String ext = file.getContentType().substring(file.getContentType().indexOf("/") + 1);   // image/jpeg 이면 jpeg만 남으므로  a_20230704140453.jpeg  이렇게 표현
				File dest = new File(dir, fileName + "_" + ymd + "." + ext);
				fileNameList.add(dest.getName());							 // 0 > 1 > 2 (size)
				try {
					file.transferTo(dest);  // f를 dest에 복사
				} catch (Exception e) {}				
				int fk = dao.selectMaxIdxFromUpload(); // 외래키 불러오기 , 가장 높은 idx 불러오기(마지막에 넣은 값)
				System.out.println("마지막 인덱스 : " + fk);
				
				HashMap<String, Object> param = new HashMap<>();
				param.put("upload", fk);   // 마지막 넣은 글의 idx를 추가한다.
				param.put("list", fileNameList);
				
				row += dao.insertFile(param);
			}
		}
			
		return row;
	}

	
	

	public int deleteReview(int idx) {
		List<String> fileList = dao.selectFileList(idx);  	// 삭제할 파일 목록을 select로 가져 와야해
		for(String fileName : fileList) {
			File file = new File(dir, fileName);				// 저장된 위치에 지정한 이름의 파일
			if(file.exists()) {					// 파일이 있으면
				file.delete();					// 파일을 삭제한다.
			}
		}
		
		int row = 0;
		row += dao.deleteFile(idx);   // DB에서 파일이름을 먼저 삭제하고(자식테이블)
		row += dao.deleteReview(idx);		// 참조하는 자식 테이블 레코드가 없으면 부모테이블 삭제
													// on delete cascade  걸려있으면 row += dao.delete(idx);	 만 하면된다.
		
		return row;
	}




	public String getnick(String userid) {
		return dao.getnick(userid);
	}




	public List<GocampReviewDTO> selectAllReview(String contentId) {
		return dao.selectAllReview(contentId);
	}




	public String getContentId(int idx) {
		return dao.getContentId(idx);
	}
	
	// 통합검색용 쿼리
		public List<GocampReviewDTO> searchByKeyWord(String srchKywrd) {
			return dao.searchByKeyword(srchKywrd);
		}

	// review 게시판
	
	public int selectCountGoCampAllReview(HashMap<String, String> map) {
		return dao.selectCountGoCampAllReview(map);
	}

	public List<GocampReviewDTO> GoCampAllReview(PagingDTO paging) {
		return dao.GoCampAllReview(paging);
	}

	public GocampReviewDTO selectOneReview(int idx) {
		return dao.selectOneReview(idx);
	}

	public int countByKeyword(String srchKywrd) {
		return dao.countByKeyword(srchKywrd);
	}

}

