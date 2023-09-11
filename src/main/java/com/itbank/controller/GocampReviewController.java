
package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.itbank.model.GocampReviewDTO;
import com.itbank.model.PagingDTO;
import com.itbank.service.GocampReviewService;

@Controller
@RequestMapping("/reviewBoard")
public class GocampReviewController {
	
	@Autowired private GocampReviewService gocampReviewService;

	
	// 검색, 페이징 
	@GetMapping("") // 주소는 /freeBoard, jsp는 /freeBoard/list.jsp
	public ModelAndView list(@RequestParam(value="order", defaultValue = "") String order, @RequestParam(value="page", defaultValue = "1") int page) {  // page를 받을건데 없으면 기본값은 1이다
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("order", order);
		
	
		int boardCount = gocampReviewService.selectCountGoCampAllReview(map);    // 총게시물의 개수를 불러오자
		PagingDTO paging = new PagingDTO(page, boardCount, order);
		      
		
		
		ModelAndView mav = new ModelAndView("/reviewBoard/list");
		List<GocampReviewDTO> list = gocampReviewService.GoCampAllReview(paging);  // page로 서비스함수를 호출
		
	

		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	// 리뷰조회
		@GetMapping("/view/{idx}")
		public ModelAndView view(@PathVariable("idx") int idx,  HttpServletResponse response, HttpServletRequest request) {  
			ModelAndView mav = new ModelAndView("reviewBoard/view"); 
		
				
			
			GocampReviewDTO dto = gocampReviewService.selectOneReview(idx);
			mav.addObject("dto", dto);
			
			gocampReviewService.reduceViewCnt(idx, response,request);

			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if(auth != null && auth.isAuthenticated()) {
				String userid = auth.getName();
				String nick = gocampReviewService.getnick(userid);
				mav.addObject("nickname",nick);
			}
			
			
			return mav;
		}
		
	
		
	

		
		
	
	




}

