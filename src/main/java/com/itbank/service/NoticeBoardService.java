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
		int row = dao.updateViewCount(idx);
		System.out.println(row + "행이 수정되었습니다.");
		System.out.println(idx + "번 조회수 증가");
		return dao.selectOne(idx);
	}

}
