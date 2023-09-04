package com.itbank.controller;

import java.util.Collections;
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
	public ModelAndView list(@RequestParam(value="page", defaultValue="1") int page,
	                         @RequestParam(value="sort", required=false) String sortType) {
	    List<ProductDTO> list;
	    ModelAndView mav = new ModelAndView("/product/list");
	    
	    if ("price".equals(sortType)) {
	        list = productService.priceSelectAll(); // 가격 오름차순으로 상품 목록 가져옴
	    } else if ("price_desc".equals(sortType)) {
	        list = productService.priceSelectAll(); // 가격 내림차순으로 상품 목록 가져옴
	        Collections.reverse(list); // 가져온 목록을 뒤집어서 내림차순으로 정렬된 것처럼 처리
	    } else if ("views_desc".equals(sortType)) {
	        list = productService.viewsSelectAll(); // 조회수 오름차순으로 상품 목록 가져옴
	    } else if ("sDate_desc".equals(sortType)) {
	        list = productService.sDateSelectAll(); // 날짜 오름차순으로 상품 목록 가져옴
	    } else if ("pStar_desc".equals(sortType)) {
	        list = productService.pStarSelectAll(); // 별점 오름차순으로 상품 목록 가져옴
	    } else {
	        int productCount = productService.selectCount();
	        ShopPagingDTO paging = new ShopPagingDTO(page, productCount);
	        
	        list = productService.selectAll(paging); // 일반적인 상품 목록 가져옴
	        mav.addObject("paging", paging);
	    }
	    
	    mav.addObject("list", list);
	    return mav;
	}
	// 단일검색 
	
	// 카테고리별 검색(미완성)
//	@GetMapping("/list/{pCategory}")
//	public ModelAndView view(@PathVariable("pCategory") String pCategory) {
//		ModelAndView mav = new ModelAndView("/product/list");
//		ProductDTO dto = productService.selectOne(pCategory);
//		mav.addObject("dto", dto);
//		return mav;
//		
//	}
	
	// 삭제
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = productService.delete(idx);
		System.out.println(row + "행이 삭제되었습니다");
		return "redirect:/";
	}
	
	   // 상품 상세페이지
	   @GetMapping("/view/{idx}")
	   public ModelAndView view(@PathVariable("idx") int idx) {
	      ModelAndView mav = new ModelAndView("product/view");
	      ProductDTO dto = productService.selectDetails(idx);
	      mav.addObject("dto", dto);
	      return mav;
	   }

	
	// 장바구니
	@GetMapping("/basket")
	public ModelAndView basket() {
		ModelAndView mav = new ModelAndView("product/basket");
		return mav;
	}
	
	// 주문결제
	@GetMapping("/orderpay")
	public ModelAndView orderpay() {
		ModelAndView mav = new ModelAndView("product/orderpay");
		return mav;
	}
	
	// 주문완료
	@GetMapping("/lastorder")
	public ModelAndView lastoder() {
		ModelAndView mav = new ModelAndView("product/lastorder");
		return mav;
	}
}
