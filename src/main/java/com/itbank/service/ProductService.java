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

	public ProductDTO selectDetails(int idx) {
		return dao.selectDetails(idx);
	}

	public ProductDTO selectpName(String pName) {
		return dao.selectpName(pName);
	}

	public List<ProductDTO> priceSelectAll() {
		return dao.priceSelectAll();
	}

	public List<ProductDTO> viewsSelectAll() {
		return dao.viewsSelectAll();
	}

	public List<ProductDTO> sDateSelectAll() {
		return dao.sDateSelectAll();
	}

	public List<ProductDTO> pStarSelectAll() {
		return dao.pStarSelectAll();
	}

	public int grocery(ProductDTO dto) {
		int row = 0;
		if (dao.validategrocery(dto) != 0) {
			row = dao.updatecurrentgrocery(dto);
		}
		else {
			row = dao.grocery(dto);			
		}
		return row;
	}

}
