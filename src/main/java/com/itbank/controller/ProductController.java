package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BasketDTO;
import com.itbank.model.CouponDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.PaylistDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.ShopPagingDTO;
import com.itbank.service.LoginService;
import com.itbank.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired private ProductService productService;
	@Autowired private LoginService loginService;
	
	// 목록 - 페이징  - 단일검색
	@GetMapping("/list")
	public ModelAndView list(
	    @RequestParam(value="page", defaultValue="1") int page,
	    @RequestParam(value="sort", defaultValue="pName") String sort,
	    @RequestParam(value="pName", defaultValue="") String pName // 검색어를 받아옵니다.
	) {
		int boardCount = productService.selectCount(pName);
		ShopPagingDTO dto = new ShopPagingDTO(page, boardCount);
	    List<ProductDTO> list = productService.selecAll(page, sort, pName, dto);
	    ModelAndView mav = new ModelAndView("/product/list");
	    mav.addObject("paging", dto);
	    mav.addObject("list", list);
	    return mav;
	}
	
	// 삭제
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = productService.delete(idx);
		System.out.println(row + "행이 삭제되었습니다");
		return "redirect:/product/list";
	}
	
    // 상품 상세페이지
    @GetMapping("/view/{idx}")
    public ModelAndView view(@PathVariable("idx") int idx) {
       ModelAndView mav = new ModelAndView("product/view");
       ProductDTO dto = productService.selectDetails(idx);
       mav.addObject("dto", dto);
       return mav;
    }

	// 상품 등록
	@GetMapping("/addProduct")
	public void addProduct() {	}
	

	@PostMapping("/addProduct")
	public String addProduct(ProductDTO dto) {
		int row = productService.addProduct(dto);
		System.out.println(row != 0 ? "추가 성공" : "추가 실패");
		return "redirect:/product/list";
	}
	
	// 상품 수정
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("product/modify");
		ProductDTO dto = productService.selectDetails(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modify/{idx}")
	public String modify(ProductDTO dto) {
		int row = productService.update(dto);
		System.out.println(row != 0 ? "수정 성공" : "수정 실패");
		return "redirect:/product/view/{idx}";
	}	 
	   
	   // 장바구니
	   @GetMapping("/basket")
	   public ModelAndView basket() {
		    ModelAndView mav = new ModelAndView("product/basket");
		    // 1. 로그인된 사용자의 userid 얻기
		    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		    String userId = null;
		    
		    if (principal instanceof UserDetails) {
		        userId = ((UserDetails) principal).getUsername(); // getUsername()은 userid를 반환한다고 가정
		    } else {
		        userId = principal.toString();
		    }
		    if (userId == null) {
		    // 에러 처리 (예: 로그인 페이지로 리다이렉트)
		        return new ModelAndView("redirect:/login");
		    }
		    // 2. 해당 userid의 장바구니 항목 가져오기
		    List<BasketDTO> basketlist = productService.basketSelectAll(userId);
		    List<CouponDTO> coupon = loginService.couponSelectAll(userId);
		    // 3. 결과를 ModelAndView 객체에 추가하고 반환
		    mav.addObject("basketlist", basketlist);
		    mav.addObject("coupon", coupon);
		    return mav;
		}

	// 주문결제
	@GetMapping("/orderpay")
	public ModelAndView orderpay() {
		ModelAndView mav = new ModelAndView("product/orderpay");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = null;
		
		if (principal instanceof UserDetails) {
	        userId = ((UserDetails) principal).getUsername(); // getUsername()은 userid를 반환한다고 가정
	    } else {
	        userId = principal.toString();
	    }
	    if (userId == null) {
	    // 에러 처리 (예: 로그인 페이지로 리다이렉트)
	        return new ModelAndView("redirect:/login");
	    }
	    // 2. 해당 userid의 장바구니 항목 가져오기
	    PaylistDTO paylist = productService.paylist(userId);
	    List<MemberDTO> userInfo = productService.getuserInfo(userId);
	    List<BasketDTO> orderlist = productService.basketSelectAll(userId);
	    List<CouponDTO> coupon = loginService.couponSelectAll(userId);
	    // 3. 결과를 ModelAndView 객체에 추가하고 반환
	    mav.addObject("paylist", paylist);
	    mav.addObject("userInfo", userInfo);
	    mav.addObject("orderlist", orderlist);
	    mav.addObject("coupon", coupon);
		return mav;
	}
	
	// 주문완료
	@GetMapping("/lastorder")
	public ModelAndView lastoder() {
		ModelAndView mav = new ModelAndView("product/lastorder");
		return mav;
	}
	
//	// 주문목록
//	@GetMapping("/orderlist")
//	public ModelAndView orderlist() {
//		ModelAndView mav = new ModelAndView("product/orderlist");
//		return mav;
//	}
	
	
	// 장바구니 삭제
	@GetMapping("/basket/{idx}")
	public String basketdelete(@PathVariable("idx") int idx) {
		int row = productService.basketdelete(idx);
		System.out.println(row + "행이 삭제되었습니다");
		return "redirect:/product/basket";
	}
	
	// 장바구니 수량 삭제
	@PostMapping("/basketmodify/{idx}")
	public String basketmodify(BasketDTO dto) {	// 커맨드 객체는 PathVariable도 파라미터 자동 주입
		int row = productService.basketmodify(dto);
		System.out.println(row + "행이 수정되었습니다");
		return "redirect:/product/basket/{idx}";
	}
	
}
