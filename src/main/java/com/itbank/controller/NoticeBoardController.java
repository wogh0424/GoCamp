package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.FreeBoardDTO;
import com.itbank.model.NoticeBoardDTO;
import com.itbank.model.PagingDTO;
import com.itbank.service.NoticeBoardService;

@Controller
@RequestMapping("/noticeBoard")
public class NoticeBoardController {
	
	@Autowired private NoticeBoardService noticeBoardService;
	
	@GetMapping("")
	public ModelAndView list(@RequestParam(value="column", defaultValue="title")String column, @RequestParam(value="search", defaultValue = "")String search, @RequestParam(value="page", defaultValue = "1")int page) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("column", column);
		
		int boardCount = noticeBoardService.selectCount(map);
		PagingDTO paging = new PagingDTO(page, boardCount, search, column);
		
		ModelAndView mav = new ModelAndView("/noticeBoard/list");
		List<NoticeBoardDTO> list = noticeBoardService.selectAll(paging); 
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {   
		ModelAndView mav = new ModelAndView("/noticeBoard/view"); 
		
		NoticeBoardDTO dto = noticeBoardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String write(NoticeBoardDTO dto) {
		int row = noticeBoardService.write(dto);
		System.out.println(row + "행이 추가되었습니다.");
		return "redirect:/noticeBoard";
	}
	

	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = noticeBoardService.delete(idx);
		System.out.println(row + "행이 삭제되었습니다.");
		return "redirect:/noticeBoard";
	}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/noticeBoard/modify");
		NoticeBoardDTO dto = noticeBoardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modify/{idx}")
	public String modify(NoticeBoardDTO dto) {
		noticeBoardService.update(dto);
		return "redirect:/noticeBoard/view/{idx}";
	}
	
	
	
		
		
		
		

}
