package com.itbank.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.ProductDTO;
import com.itbank.model.ShopPagingDTO;

@Repository
public interface ProductDAO {

	List<ProductDTO> selectAll(ShopPagingDTO paging);

	int delete(int idx);

	int selectCount();

	ProductDTO selectOne(String pCategory);

	ProductDTO selectDetails(int idx);

}