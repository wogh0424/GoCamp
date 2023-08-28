package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itbank.model.FreeBoardDTO;
import com.itbank.model.NoticeBoardDTO;
import com.itbank.model.PagingDTO;
import com.itbank.repository.NoticeBoardDAO;

@Service
public class NoticeBoardService {
	
	@Autowired private NoticeBoardDAO dao;

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
		return dao.insertBoard(dto);
	}
	
	// 게시글 삭제
	public int delete(int idx) {
		return dao.delete(idx);
	}
		
	// 게시글 수정
	public int update(NoticeBoardDTO dto) {
		return dao.update(dto);
	}

}
