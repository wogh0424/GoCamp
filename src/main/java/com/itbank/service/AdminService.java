package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.AdminDTO;
import com.itbank.repository.AdminDAO;

@Service
public class AdminService {

	@Autowired private AdminDAO dao;
	
	public List<AdminDTO> deletedBoard(String nick) {
		return dao.deletedBoard(nick);
	}

}
