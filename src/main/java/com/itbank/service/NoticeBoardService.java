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


import com.itbank.model.NoticeBoardDTO;
import com.itbank.model.PagingDTO;
import com.itbank.repository.NoticeBoardDAO;

@Service
public class NoticeBoardService {
	
	@Autowired private NoticeBoardDAO dao;
	

	private File dir = new File("/usr/local/tomcat/webapps/upload");
	
	// directory 없으면 만들기(성공)
	public NoticeBoardService() {
			if(dir.exists() == false) {
				dir.mkdirs();
			}
	}

	public int selectCount(HashMap<String, String> map) {
		return dao.selectCount(map);
	}

	public List<NoticeBoardDTO> selectAll(PagingDTO paging) {
		return dao.selectAll(paging);
	}

	@Transactional
	public NoticeBoardDTO selectOne(int idx) {
		dao.updateViewCount(idx);
		return dao.selectOne(idx);
	}

	// 게시글 작성
	public int write(NoticeBoardDTO dto) {
		int row = 0;
		
		System.out.println("파일 경로 : " + dto.getFilePath());
		row += dao.insertBoard(dto);
		System.err.println("uploadsize : " + dto.getUpload().get(0).getOriginalFilename());

		List<MultipartFile> uploadList =  dto.getUpload();		// 첨부파일의 목록  (2)
		for(MultipartFile f : uploadList) {				// 2회 반복
			String ymd = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
			String fileName = f.getOriginalFilename();   // a.jpg
			if (fileName.equals("")) {
				continue;
			}
			else {
				ArrayList<String> fileNameList = new ArrayList<>();  // (파일 이름 추가할 수 있는) 비어있는 문자열 리스트  (0)
				fileName = fileName.substring(0, fileName.lastIndexOf("."));   // a (마지막 index는 포함되지 않으니 a만 남는다,)
				
				String ext = f.getContentType().substring(f.getContentType().indexOf("/") + 1);   // image/jpeg 이면 jpeg만 남으므로  a_20230704140453.jpeg  이렇게 표현
				File dest = new File(dir, fileName + "_" + ymd + "." + ext);
				fileNameList.add(dest.getName());							 // 0 > 1 > 2 (size)
				try {
					f.transferTo(dest);  // f를 dest에 복사
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
		List<String> fileList = dao.selectFileList(idx);
		for(String fileName : fileList) {
			File file = new File(dir, fileName);			
			if(file.exists()) {				
				file.delete();					
			}
		}
		
		int row = 0;
		row += dao.deleteFile(idx);
		row += dao.delete(idx);
		return row;
	}
		
	// 게시글 수정
	public int update(NoticeBoardDTO dto) {
		return dao.update(dto);
	}

}
