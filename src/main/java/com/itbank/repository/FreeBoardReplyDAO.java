package com.itbank.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.FreeBoardReplyDTO;

@Repository
public interface FreeBoardReplyDAO {



	List<FreeBoardReplyDTO> getReply(int idx);

	int insertReply(FreeBoardReplyDTO reply);

	int updateReply(FreeBoardReplyDTO dto);

	int deleteReply(int idx);

	int getFreeBoardIdx(int idx);

	int updateReplyCount(FreeBoardReplyDTO reply);






}
