package com.itbank.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.EventBoardDTO;
import com.itbank.model.NoticeBoardDTO;
import com.itbank.model.PagingDTO;
import com.itbank.repository.EventBoardDAO;

@Service
public class EventBoardService {

	@Autowired private EventBoardDAO dao;
	
	
	private File dir = new File("C:\\Users/yeonji/git/GoCamp/src/main/webapp/resources/image");
	
	// directory 없으면 만들기(성공)
	public EventBoardService() {
			if(dir.exists() == false) {
				dir.mkdirs();
			}
	}
	
	
	public int selectCount(HashMap<String, String> map) {
		return dao.selectCount(map);
	}


	public List<EventBoardDTO> selectAll(PagingDTO paging) {
		return dao.selectAll(paging);
	}


	public EventBoardDTO selectOne(int idx) {
		dao.updateViewCount(idx);
		return dao.selectOne(idx);
	}
	
	// 게시글 작성(+파일첨부)
	public int write(EventBoardDTO dto) {
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

		int row = 0;
		
		row += dao.insertBoard(dto);
		int fk = dao.selectMaxIdxFromUpload(); // 외래키 불러오기 , 가장 높은 idx 불러오기(마지막에 넣은 값)
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("upload", fk);   // 마지막 넣은 글의 idx를 추가한다.
		param.put("list", fileNameList);
		
		row += dao.insertFile(param);
		
		return row;
	}
	
	// 게시글 삭제
	public int delete(int idx) {
		List<String> fileList = dao.selectFileList(idx);
		for(String fileName : fileList) {
			File f = new File(dir, fileName);			
			if(f.exists()) {				
				f.delete();					
			}
		}
		
		int row = 0;
		row += dao.deleteFile(idx);
		row += dao.delete(idx);
		return row;
	}
		
	// 게시글 수정
	public int update(EventBoardDTO dto) {
		return dao.update(dto);
	}

}
