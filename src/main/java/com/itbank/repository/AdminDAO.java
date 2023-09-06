package com.itbank.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.AdminDTO;

@Repository
public interface AdminDAO {

	int setDeletedReason(AdminDTO dto);

	List<AdminDTO> deletedBoard(String nick);
}
