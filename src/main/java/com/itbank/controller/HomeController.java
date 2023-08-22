package com.itbank.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public ModelAndView home(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("home");
		String version = testService.getVersion();
		mav.addObject("version", version);
		return mav;
	}
	
	@GetMapping("/main")
	public ModelAndView main(@RequestParam(value="page", defaultValue="1") int page, 
							 @RequestParam(value="order", defaultValue="clickCnt") String order,
							 SearchDTO search){
		ModelAndView mav = new ModelAndView("main");
		int campCnt = campService.selectCnt(search);
		PagingDTO paging = new PagingDTO(page, campCnt, order);
		PageAndSearchDTO searchPage = new PageAndSearchDTO(paging, search);
		List<ItemDTO> list = campService.selectAll(searchPage);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/view/{contentId}")
	public ModelAndView view(@PathVariable("contentId") String contentId)	{
		ModelAndView mav = new ModelAndView("view");
		String camp = campService.selectId(contentId);
		mav.addObject("contentId", contentId);
		mav.addObject("camp", camp);
		return mav;
	}
}
