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
import com.itbank.model.FreeBoardReplyDTO;
import com.itbank.model.PagingDTO;
import com.itbank.service.FreeBoardReplyService;
import com.itbank.service.FreeBoardService;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {
	
	@Autowired private FreeBoardService freeBoardService;	
	@Autowired private FreeBoardReplyService freeBoardReplyService;	
	
	@GetMapping("") // 주소는 /freeBoard, jsp는 /freeBoard/list.jsp
	public ModelAndView list(@RequestParam(value="column", defaultValue = "title") String column, @RequestParam(value="search", defaultValue = "") String search, @RequestParam(value="page", defaultValue = "1") int page) {  // page를 받을건데 없으면 기본값은 1이다
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("column", column);
		
		int boardCount = freeBoardService.selectCount(map);    // 총게시물의 개수를 불러오자
		PagingDTO paging = new PagingDTO(page, boardCount, search, column);
		
		System.out.println(page);
		System.out.println();
		System.out.println();
		System.out.println(paging.isPrev());
		System.out.println(paging.isNext());
		System.out.println();
		                           
		ModelAndView mav = new ModelAndView("/freeBoard/list");
		List<FreeBoardDTO> list = freeBoardService.selectAll(paging);  // page로 서비스함수를 호출
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String write(FreeBoardDTO dto) {
		int row = freeBoardService.write(dto);
		System.out.println(row + "행이 추가되었습니다.");
		return "redirect:/freeBoard";
	}
	
	
	// ☆ <a href="">링크 클릭 ☆
	// location.href = '주소', loacation.replace('주소')
	// <form method="GET">
	// response.sendRedirect("")
	@GetMapping("/view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {   // 메소드의 파라미터에 @PathVariable("idx")를 사용하여 idx 변수를 경로 변수에 매핑. 이렇게 하면 URL에서 추출된 실제 값이 해당 파라미터에 할당
		ModelAndView mav = new ModelAndView("/freeBoard/view"); // 눌렀을 때 자료를 불러와야하니 modelandview, 그리고 따로 입력값을 주지 않아도 되니 postmapping은 쓸 필요 없다.
		// 게시글 조회
		FreeBoardDTO dto = freeBoardService.selectOne(idx);
		mav.addObject("dto", dto);
		
		// 댓글 목록 조회
		List<FreeBoardReplyDTO> replyList = freeBoardReplyService.getReply(idx);
		mav.addObject("replyList", replyList);
	
		
		return mav;
	}
	
	@PostMapping("/view/{idx}")
	public String writeReply(@PathVariable("idx") int idx, FreeBoardReplyDTO reply) {

		freeBoardReplyService.writeReply(reply);
		
		return "redirect:/freeBoard/view/" + idx;
	}
	
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = freeBoardService.delete(idx);
		System.out.println(row + "행이 삭제되었습니다.");
		return "redirect:/freeBoard";
	}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/freeBoard/modify");
		FreeBoardDTO dto = freeBoardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modify/{idx}")
	public String modify(FreeBoardDTO dto) {
		freeBoardService.update(dto);
		return "redirect:/freeBoard/view/{idx}";
	}
	

}
