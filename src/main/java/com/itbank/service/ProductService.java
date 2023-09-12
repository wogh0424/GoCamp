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

import com.itbank.model.BasketDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.PaylistDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.Product_fileDTO;
import com.itbank.model.ShopPagingDTO;
import com.itbank.repository.ProductDAO;

@Service
public class ProductService {
	
	@Autowired private ProductDAO dao;
	
	private File dir = new File("/upload");
		
	public ProductService() {
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	public int selectCount(String pName) {
		return dao.selectCount(pName);
	}
	
	public List<ProductDTO> selecAll(int page, String sort, String pName, ShopPagingDTO dto) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("sort", sort);
		params.put("pName", pName);
		params.put("paging", dto);
		return dao.selectAll(params);
	}
	
	public int delete(int idx) {
		return dao.delete(idx);
	}

	public ProductDTO selectDetails(int idx) {
		return dao.selectDetails(idx);
	}
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
	
	public List<BasketDTO> basketSelectAll(String userId) {
		return dao.basketSelectAll(userId);
	}

	public int basketdelete(int idx) {
		return dao.basketdelete(idx);
	}

	public int basketmodify(BasketDTO dto) {
		return dao.basketmodify(dto);
	}

	public List<MemberDTO> getuserInfo(String userId) {
		return dao.getuserInfo(userId);
	}

	public PaylistDTO paylist(String userId) {
		return dao.paylist(userId);
	}

	public int gotopay(PaylistDTO dto) {
		int row = 0;
		row =  dao.gotopay(dto);
		return row;
	}

	public List<ProductDTO> searchByKeyWord(String srchKywrd) {
		return dao.searchByKeyWord(srchKywrd);
	}

	public int countByKeyWord(String srchKywrd) {
		return dao.countByKeyWord(srchKywrd);
	}

}
