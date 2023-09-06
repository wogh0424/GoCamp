package com.itbank.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

<<<<<<< HEAD
import com.itbank.model.CampDTO;
=======
import com.itbank.model.BasketDTO;
>>>>>>> 01cdba27456be5c3dd472d5cfc67b23ce895ecd8
import com.itbank.model.ProductDTO;
import com.itbank.model.Product_fileDTO;
import com.itbank.model.ShopPagingDTO;
import com.itbank.repository.ProductDAO;

@Service
public class ProductService {
	
	@Autowired private ProductDAO dao;
	
	private File dir = new File("C:\\Users/capta/git/GoCamp/src/main/webapp/resources/upload/");
		
		public ProductService() {
			if(dir.exists() == false) {
				dir.mkdirs();
			}
		}
	
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

<<<<<<< HEAD
	public List<ProductDTO> addProduct() {
		return dao.addProduct();
	}
	
	@Transactional
	public int addProduct(ProductDTO dto) {
		int row = 0;

		row += dao.addProduct(dto);
//		System.err.println("uploadsize : " + dto.getUpload().get(0).getOriginalFilename());

		List<MultipartFile> uploadList = dto.getUpload();

		for (MultipartFile file : uploadList) {
			String ymd = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
			String fileName = file.getOriginalFilename();
			if (fileName.equals("")) {
				continue;
			} else {
				ArrayList<String> fileNameList = new ArrayList<>();
				fileName = fileName.substring(0, fileName.lastIndexOf("."));

				String ext = file.getContentType().substring(file.getContentType().indexOf("/") + 1);
				File dest = new File(dir, fileName + "_" + ymd + "." + ext);
				fileNameList.add(dest.getName());
				try {
					file.transferTo(dest);
				} catch (Exception e) {
				}
				int fk = dao.selectMaxIdxFromUpload();

				HashMap<String, Object> param = new HashMap<>();
				param.put("upload", fk);
				param.put("list", fileNameList);

				row += dao.addFile(param);
			}
		}
		return row;
	}
	
	@Transactional
	public int update(ProductDTO dto) {
		int row = 0;

		row += dao.update(dto);
//		System.err.println("uploadsize : " + dto.getUpload().get(0).getOriginalFilename());

		List<MultipartFile> uploadList = dto.getUpload();

		for (MultipartFile file : uploadList) {
			String ymd = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
			String fileName = file.getOriginalFilename();
			if (fileName.equals("")) {
				continue;
			} else {
				ArrayList<String> fileNameList = new ArrayList<>();
				fileName = fileName.substring(0, fileName.lastIndexOf("."));

				String ext = file.getContentType().substring(file.getContentType().indexOf("/") + 1);
				File dest = new File(dir, fileName + "_" + ymd + "." + ext);
				fileNameList.add(dest.getName());
				try {
					file.transferTo(dest);
				} catch (Exception e) {
				}
				int fk = dao.selectMaxIdxFromUpload();

				HashMap<String, Object> param = new HashMap<>();
				param.put("upload", fk);
				param.put("list", fileNameList);

				row += dao.addFile(param);
			}
		}
		return row;
	}

	public List<Product_fileDTO> showProductImages(int idx) {
		return dao.showProductImages(idx);
	}

	public boolean deletefile(String filePath) {
		return dao.deletefile(filePath);
	}
	
}
=======
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
		
	public List<ProductDTO> selectOne(String name) {
		return dao.selectOne(name);
	}

	public List<BasketDTO> basketSelectAll(String userId) {
		return dao.basketSelectAll(userId);
	}

	public int basketdelete(int idx) {
		return dao.basketdelete(idx);
	}

	public int basketmodify(BasketDTO dto) {
		return dao.basketmodify(dto);
	}

}
>>>>>>> 01cdba27456be5c3dd472d5cfc67b23ce895ecd8
