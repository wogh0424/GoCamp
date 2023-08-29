package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.ProductDTO;
import com.itbank.model.ShopPagingDTO;
import com.itbank.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired private ProductService productService;
	
	// 목록 - 페이징
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value="page", defaultValue="1") int page) {
		int productCount = productService.selectCount();
		ShopPagingDTO paging = new ShopPagingDTO(page, productCount);
		
		ModelAndView mav = new ModelAndView("/product/list");
		List<ProductDTO> list = productService.selectAll(paging);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/list/{pCategory}")
	public ModelAndView view(@PathVariable("pCategory") String pCategory) {
		ModelAndView mav = new ModelAndView("/product/list");
		ProductDTO dto = productService.selectOne(pCategory);
		mav.addObject("dto", dto);
		return mav;
		
	}
	
	// 삭제
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = productService.delete(idx);
		System.out.println(row + "행이 삭제되었습니다");
		return "redirect:/";
	}
	
	// 상세목록
	@GetMapping("/product")
	public ModelAndView product() {
		ModelAndView mav = new ModelAndView("product/view");
		return mav;
	}
	
	// 장바구니
	@GetMapping("/basket")
	public ModelAndView basket() {
		ModelAndView mav = new ModelAndView("product/basket");
		return mav;
	}
}
