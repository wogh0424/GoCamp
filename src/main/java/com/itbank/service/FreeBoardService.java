package com.itbank.service;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.FreeBoardDTO;
import com.itbank.model.PagingDTO;
import com.itbank.repository.FreeBoardDAO;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDAO dao;
	
	private File dir = new File("/usr/local/tomcat/webapps/upload/");
	
	// directory 없으면 만들기(성공)
	public FreeBoardService() {
			if(dir.exists() == false) {
				dir.mkdirs();
			}
	}
	
	// 총게시물의 개수
	public int selectCount(HashMap<String, String> map) {
		return dao.selectCount(map);
	}
	// 게시판 전체 글 보여주는 목록
	public List<FreeBoardDTO> selectAll(PagingDTO paging) {
		return dao.selectAll(paging);
	}
	
	
	// 게시글 작성
	@Transactional
	public int write(FreeBoardDTO dto) {
		
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
	
	// 파일첨부 게시글 작성 
//	public int write(FreeBoardDTO dto) {
		
//		List<MultipartFile> uploadList =  dto.getUpload();		
//		ArrayList<String> fileNameList = new ArrayList<>(); 
//		
//		for(MultipartFile f : uploadList) {			
//			File dest = new File(dir, f.getOriginalFilename()); 		
//			fileNameList.add(dest.getName());				
//			try {
//				f.transferTo(dest);  // 
//			} catch (Exception e) {}
//		}
//		
//		int row = 0;
//		
//		row += dao.insertBoard(dto);
//		int fk = dao.selectMaxIdxFromUpload();
//		
//		HashMap<String, Object> param = new HashMap<>();
//		param.put("upload", fk); 
//		param.put("list", fileNameList);
//		
//		row += dao.insertBoard(dto);
//
//		return row;
//	}

	

	// 게시글 조회
	public FreeBoardDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}
	
	// 게시글 삭제
	public int deleteFreeBoard(int idx) {
		List<String> fileList = dao.selectFileList(idx);
		for(String fileName : fileList) {
			File f = new File(dir, fileName);			
			if(f.exists()) {				
				f.delete();					
			}
		}
		
		int row = 0;
		row += dao.deleteFile(idx);
		row += dao.deleteFreeBoard(idx);
		return row;
	}
	
	// 게시글 수정
	public int update(FreeBoardDTO dto) {
		return dao.update(dto);
	}
	
	// 게시 글 작성자에 닉네임 받아오기
	public String getnick(String userid) {
		return dao.getnick(userid);
	}
	
	// 조회수 20초 간격으로 증가시키기 
	public void reduceViewCnt(int idx, HttpServletResponse response, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		boolean isVisited = true;

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("viewCount".equals(cookie.getName())) {
					isVisited = false;
					break;
				}
			}
		}
		if(isVisited) {
			dao.updateViewCount(idx);
			Cookie cookie = new Cookie("viewCount","true");
			cookie.setMaxAge(10);
			response.addCookie(cookie);
		}
		
	}

	
}
