package com.itbank.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.model.ItemDTO;
import com.itbank.model.PageAndSearchDTO;
import com.itbank.model.PagingDTO;
import com.itbank.model.SearchDTO;
import com.itbank.service.CampService;
import com.itbank.service.TestService;

@Controller
public class HomeController {

	@Autowired private TestService testService;
	@Autowired private CampService campService;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		String version = testService.getVersion();
		mav.addObject("version", version);
		return mav;
	}
	
	@GetMapping("/main")
	public ModelAndView main(@RequestParam(value="page", defaultValue="1") int page, 
							 @RequestParam(value="order", defaultValue="clickCnt") String order,
							 @RequestParam(value="listTy", defaultValue="LIST") String listTy,
							 SearchDTO search){
		ModelAndView mav = new ModelAndView("main");
		int campCnt = campService.selectCnt(search);
		PagingDTO paging = new PagingDTO(page, campCnt, order);
		PageAndSearchDTO searchPage = new PageAndSearchDTO(paging, search);
		List<ItemDTO> list = campService.selectAll(searchPage);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("listTy", listTy);
		return mav;
	}
	
	@GetMapping("/view/{contentId}")
	public ModelAndView view(@PathVariable("contentId") String contentId) throws IOException	{
		ModelAndView mav = new ModelAndView("view");
		String camp = campService.selectId(contentId);
		Map<String, Object> view = campService.requestAPI(contentId, camp);
		List<Map<String, Object>> imgList = campService.requestAPI(contentId); 
		mav.addObject("view", view);
		mav.addObject("images", imgList);
		return mav;
	}
}
