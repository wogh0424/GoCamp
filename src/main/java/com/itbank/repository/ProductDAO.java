package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.BasketDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.PaylistDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.Product_fileDTO;

@Repository
public interface ProductDAO {

	int delete(int idx);

	ProductDTO selectDetails(int idx);

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

	int grocery(ProductDTO dto);

	int validategrocery(ProductDTO dto);

	int updatecurrentgrocery(ProductDTO dto);


	List<BasketDTO> basketSelectAll(String userId);

	int basketdelete(int idx);

	int basketmodify(BasketDTO dto);

	List<ProductDTO> selectAll(HashMap<String, Object> params);

	int selectCount(String pName);

	List<MemberDTO> getuserInfo(String userId);

	int setPayList(PaylistDTO dto);

	List<ProductDTO> searchByKeyWord(String srchKywrd);

	int countByKeyWord(String srchKywrd);

}
