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

	ProductDTO selectDetails(int idx);

	List<ProductDTO> priceSelectAll();

	List<ProductDTO> viewsSelectAll();

	List<ProductDTO> sDateSelectAll();

	List<ProductDTO> pStarSelectAll();

	int grocery(ProductDTO dto);

	int validategrocery(ProductDTO dto);

	int updatecurrentgrocery(ProductDTO dto);

	List<ProductDTO> selectOne(String name);

}
