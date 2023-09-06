package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.NoticeBoardDTO;
import com.itbank.model.PagingDTO;
import com.itbank.service.NoticeBoardService;

@Controller
@RequestMapping("/noticeBoard")
public class NoticeBoardController {
	
	@Autowired private NoticeBoardService noticeBoardService;
	
	@GetMapping("")
	public ModelAndView list(@RequestParam(value="order", defaultValue = "")String order, @RequestParam(value="page", defaultValue = "1")int page) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("order", order);
		
		int boardCount = noticeBoardService.selectCount(map);
		PagingDTO paging = new PagingDTO(page, boardCount, order);
		
		ModelAndView mav = new ModelAndView("/noticeBoard/list");
		List<NoticeBoardDTO> list = noticeBoardService.selectAll(paging); 
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx, HttpServletResponse response, HttpServletRequest request) {   
		ModelAndView mav = new ModelAndView("/noticeBoard/view"); 
		
		noticeBoardService.reduceViewCnt(idx, response,request);
		
		NoticeBoardDTO dto = noticeBoardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	
	// 작성
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String write(NoticeBoardDTO dto) {
		int row = noticeBoardService.write(dto);
		System.out.println(row + "행이 추가되었습니다.");
		return "redirect:/noticeBoard";
	}
	
	// 삭제
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = noticeBoardService.delete(idx);
		System.out.println(row + "행이 삭제되었습니다.");
		return "redirect:/noticeBoard";
	}
	
	// 수정
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
