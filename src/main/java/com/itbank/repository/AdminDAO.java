package com.itbank.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.AdminDTO;
import com.itbank.model.IncomeDTO;
import com.itbank.model.SalesDTO;

@Repository
public interface AdminDAO {

	int setDeletedReason(AdminDTO dto);

	List<AdminDTO> deletedBoard(String nick);
	
	List<SalesDTO> requestYesternayData();

	List<SalesDTO> requestTodayChartData();

	List<IncomeDTO> requestincome();
}
