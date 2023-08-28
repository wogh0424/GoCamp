package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.FreeBoardReplyDTO;
import com.itbank.repository.FreeBoardReplyDAO;

@Service
public class FreeBoardReplyService {
	
	@Autowired private FreeBoardReplyDAO dao;

	

	public List<FreeBoardReplyDTO> getReply(int idx) {
		return dao.getReply(idx);
	}



	public int writeReply(FreeBoardReplyDTO reply) {
		return dao.insertReply(reply);
	}


	// 댓글 수정 삭제

	public int updateReply(FreeBoardReplyDTO dto) {
		return dao.updateReply(dto);
		
	}



	public int deleteReply(int idx) {
		return dao.deleteReply(idx);
	}




}
