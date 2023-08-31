package com.itbank.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.model.EventBoardDTO;
import com.itbank.model.GocampReviewDTO;
import com.itbank.model.ItemDTO;
import com.itbank.model.PageAndSearchDTO;
import com.itbank.model.MainPagingDTO;
import com.itbank.model.NoticeBoardDTO;
import com.itbank.model.SearchDTO;
import com.itbank.model.TagDTO;
import com.itbank.service.CampService;
import com.itbank.service.EventBoardService;
import com.itbank.service.GocampReviewService;
import com.itbank.service.NoticeBoardService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired private CampService campService;
	@Autowired private NoticeBoardService noticeService;
	@Autowired private EventBoardService eventService;
	@Autowired private GocampReviewService reviewService;
	
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
		return mav;
	}
	
	@GetMapping("/search")
	public ModelAndView search(String srchKywrd) {
		ModelAndView mav = new ModelAndView("/main/search");
		List<ItemDTO> camplist = campService.searchByKeyWord(srchKywrd);
		List<NoticeBoardDTO> noticelist = noticeService.searchByKeyWord(srchKywrd);
		List<EventBoardDTO> eventlist = eventService.searchByKeyWord(srchKywrd);
		List<GocampReviewDTO> reviewlist = reviewService.searchByKeyWord(srchKywrd);
	
		mav.addObject("keyword", srchKywrd);
		mav.addObject("campList", camplist); 
		mav.addObject("noticelist", noticelist);
		mav.addObject("eventlist", eventlist);
		mav.addObject("reviewlist", reviewlist);
		return mav;
	}
}
