package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ProductDTO;
import com.itbank.model.ShopPagingDTO;
import com.itbank.repository.ProductDAO;


@Service
public class ProductService {
	
	@Autowired private ProductDAO dao;
	
	public List<ProductDTO> selectAll(ShopPagingDTO paging) {
		return dao.selectAll(paging);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public int selectCount() {
		return dao.selectCount();
	}

	public ProductDTO selectOne(String pCategory) {
		return dao.selectOne(pCategory);
	}

	public ProductDTO selectDetails(int idx) {
		return dao.selectDetails(idx);
	}

}
