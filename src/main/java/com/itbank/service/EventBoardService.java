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

import com.itbank.model.EventBoardDTO;
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
		int row = 0;
		
		System.out.println("파일 경로 : " + dto.getFilePath());
		row += dao.insertBoard(dto);
		System.err.println("uploadsize : " + dto.getUpload().get(0).getOriginalFilename());

		List<MultipartFile> uploadList =  dto.getUpload();		// 첨부파일의 목록  (2)
		for(MultipartFile file : uploadList) {				// 2회 반복
			String ymd = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
			String fileName = file.getOriginalFilename();   // a.jpg
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
	
	// 게시글 삭제
	public int delete(int idx) {
		return dao.delete(idx);
	}
		
	// 게시글 수정
		@Transactional
		public int update(EventBoardDTO dto){
		    int row = 0;

		    // 게시글 내용 수정
		    row += dao.update(dto);
		    
		    // 체크된 이미지 삭제
		    if(dto.getDeleteImages() != null && !dto.getDeleteImages().isEmpty()) {
		    for (String filePath : dto.getDeleteImages()) { // deleteImages는 선택된 이미지의 경로 리스트
		        File file = new File(dir, filePath);
		        if(file.exists()) {				
		            file.delete();					
		        }
		        dao.deleteFile(filePath);
		    }
		    }

		    // 새로 업로드된 파일 처리
		    List<MultipartFile> uploadList = dto.getUpload();
		    for (MultipartFile file : uploadList) {
		        String ymd = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		        String fileName = file.getOriginalFilename();
		        
		        if (!fileName.equals("")) {
		            ArrayList<String> fileNameList = new ArrayList<>();
		            fileName = file.getOriginalFilename().substring(0, fileName.lastIndexOf("."));
		            String ext = file.getContentType().substring(file.getContentType().indexOf("/") + 1);
		            File dest = new File(dir, fileName + "_" + ymd + "." + ext);
		            fileNameList.add(dest.getName());
		            try {
		                file.transferTo(dest);
		            } catch (Exception e) {}				
		            int fk = dto.getIdx(); 
		            HashMap<String, Object> param = new HashMap<>();
		            param.put("upload", fk);
		            param.put("list", fileNameList);
		            row += dao.insertFile(param);
		        }
		    }
		    return row;
		}
	
	// 통합검색용 쿼리
		public List<EventBoardDTO> searchByKeyWord(String srchKywrd) {
			return dao.searchByKeyWord(srchKywrd);
		}


		public int countByKeyword(String srchKywrd) {
			return dao.countByKeyword(srchKywrd);
		}


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
				cookie.setMaxAge(20);
				response.addCookie(cookie);
			}
			
		}

}
