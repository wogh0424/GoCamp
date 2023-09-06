package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.BasketDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.Product_fileDTO;
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

<<<<<<< HEAD
	int selectMaxIdxFromUpload();

	int addFile(HashMap<String, Object> param);

	int update(ProductDTO dto);

	List<String> getImagePaths();

	int deletefile(int idx);

	int addProduct(ProductDTO dto);
 
	List<ProductDTO> addProduct();

	List<Product_fileDTO> showProductImages(int idx);

	boolean deletefile(String filePath);

	int updateFile(HashMap<String, Object> param);
=======
	int grocery(ProductDTO dto);

	int validategrocery(ProductDTO dto);

	int updatecurrentgrocery(ProductDTO dto);

	List<ProductDTO> selectOne(String name);

	List<BasketDTO> basketSelectAll(String userId);

	int basketdelete(int idx);

	int basketmodify(BasketDTO dto);
>>>>>>> 01cdba27456be5c3dd472d5cfc67b23ce895ecd8

}
