package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.AdminDTO;
import com.itbank.model.IncomeDTO;
import com.itbank.model.SalesDTO;
import com.itbank.repository.AdminDAO;

@Service
public class AdminService {

	@Autowired private AdminDAO dao;
	
	public List<AdminDTO> deletedBoard(String nick) {
		return dao.deletedBoard(nick);
	}
	
	public List<SalesDTO> requestYesternayData() {
		return dao.requestYesternayData();
	}

	public List<SalesDTO> requestTodayChartData() {
		return dao.requestTodayChartData();
	}

	public List<IncomeDTO> requestincome() {
		return dao.requestincome();
	}

}
