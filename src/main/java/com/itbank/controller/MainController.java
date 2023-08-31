package com.itbank.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.model.GocampReviewDTO;
import com.itbank.model.ItemDTO;
import com.itbank.model.PageAndSearchDTO;
import com.itbank.model.MainPagingDTO;
import com.itbank.model.SearchDTO;
import com.itbank.model.TagDTO;
import com.itbank.service.CampService;
import com.itbank.service.GocampReviewService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired private CampService campService;

	@Autowired private GocampReviewService gocampReviewService;	
	@GetMapping("/camp")

	public ModelAndView main(@RequestParam(value="page", defaultValue="1") int page, 
							 @RequestParam(value="order", defaultValue="clickCnt") String order,
							 @RequestParam(value="listTy", defaultValue="LIST") String listTy,
							 SearchDTO search){
		ModelAndView mav = new ModelAndView("/main/camp");
		int campCnt = campService.selectCnt(search);
		MainPagingDTO paging = new MainPagingDTO(page, campCnt, order);
		PageAndSearchDTO searchPage = new PageAndSearchDTO(paging, search);
		List<ItemDTO> list = campService.selectAll(searchPage);
		List<TagDTO> tags = campService.selectTags();
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("listTy", listTy);
		mav.addObject("tags", tags);
		return mav;
	}
	
	@GetMapping("/view/{contentId}")
	public ModelAndView view(@PathVariable("contentId") String contentId) throws IOException	{		

		ModelAndView mav = new ModelAndView("/main/view");
		int row = campService.plusViewCount(contentId);
		System.out.println(row);

		ItemDTO view = campService.selectOne(contentId);
		mav.addObject("view", view);
		
		// 리뷰 목록가져오기 (+연지리뷰추가)
		List<GocampReviewDTO> list = gocampReviewService.selectAllReview(contentId);
		mav.addObject("list", list);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null && auth.isAuthenticated()) {
			String userid = auth.getName();
			String nick = gocampReviewService.getnick(userid);
			mav.addObject("nickname",nick);
		}
		
		
		return mav;
	}
	

	@PostMapping("/view/{contentId}")
	public String upload(GocampReviewDTO dto) {   

		int row = gocampReviewService.insert(dto);
		System.out.println(row + "행이 추가되었습니다.");
		
		return "redirect:/view/{contentId}"; 
	}
	
	@GetMapping("/deleteReview/{idx}")
	public String deleteReview(@PathVariable("idx") int idx, String contentId) {
		
		contentId = gocampReviewService.getContentIdByReviewIdx(idx);
		int row = gocampReviewService.deleteReview(idx);
		System.out.println(row + "행이 삭제되었습니다.");
		return "redirect:/view/" + contentId;
	}

	@GetMapping("/search")
	public ModelAndView search(String srchKywrd) {
		ModelAndView mav = new ModelAndView("/main/search");
		return mav;
	}
}
