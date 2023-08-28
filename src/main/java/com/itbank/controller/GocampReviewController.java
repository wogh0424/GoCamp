package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.GocampReviewDTO;
import com.itbank.service.GocampReviewService;

@Controller
public class GocampReviewController {
	
	@Autowired private GocampReviewService gocampReviewService;
	
	
	@GetMapping("/review")
	public ModelAndView review() {
		ModelAndView mav = new ModelAndView();

		List<GocampReviewDTO> list = gocampReviewService.selectAllReview();
		
		for(GocampReviewDTO dto : list) {
			System.out.println(dto.getTitle());					// 제목은 하나
			System.out.println(dto.getReview_content());			
			
			String[] arr = dto.getFilePath().split(",");
			for(String s : arr) {
				System.out.println(s);									// 파일은 여러개
			}
			System.out.println();
		}
		
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/upload")
	public String upload(GocampReviewDTO dto) {   
		
		int row = gocampReviewService.insert(dto);
		System.out.println(row + "행이 추가되었습니다.");
		
		return "redirect:/review"; 
	}
	
	@GetMapping("/deleteReview/{idx}")
	public String deleteReview(@PathVariable("idx") int idx) {
		int row = gocampReviewService.deleteReview(idx);
		System.out.println(row + "행이 삭제되었습니다.");
		return "redirect:/review";
	}
//	@GetMapping("")
//	public ModelAndView list(@RequestParam(value = "page", defaultValue = "1") int page) {
//	    int boardCount = gocampReviewService.selectCount();  // 총 게시물의 개수를 불러옴
//	    PagingDTO paging = new PagingDTO(page, boardCount);
//
//	    ModelAndView mav = new ModelAndView("/freeBoard/list");
//	    List<GocampReviewDTO> list = gocampReviewService.selectAll(paging);  // page로 서비스 함수를 호출
//	    mav.addObject("list", list);
//	    mav.addObject("paging", paging);
//	    return mav;
//	}
//
//
//
//	@GetMapping("/write")
//	public void write() {}
//	
//	@PostMapping("/write")
//	public String write(GocampReviewDTO dto) {
//		int row = gocampReviewService.write(dto);
//		System.out.println(row + "행이 추가되었습니다.");
//		return "redirect:/freeBoard";
//	}
}

