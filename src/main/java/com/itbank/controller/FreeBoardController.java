package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	
	// 검색, 페이징 
	@GetMapping("") // 주소는 /freeBoard, jsp는 /freeBoard/list.jsp
	public ModelAndView list(@RequestParam(value="column", defaultValue = "title") String column, @RequestParam(value="search", defaultValue = "") String search, @RequestParam(value="page", defaultValue = "1") int page) {  // page를 받을건데 없으면 기본값은 1이다
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("column", column);
		
		int boardCount = freeBoardService.selectCount(map);    // 총게시물의 개수를 불러오자
		PagingDTO paging = new PagingDTO(page, boardCount, search, column);
		                           
		ModelAndView mav = new ModelAndView("/freeBoard/list");
		List<FreeBoardDTO> list = freeBoardService.selectAll(paging);  // page로 서비스함수를 호출
		
//		for (FreeBoardDTO dto : list) {
//	        List<MultipartFile> upload = freeBoardService.selectUpload(dto.getIdx());  // 해당 게시글의 파일 경로 조회
//	        dto.setUpload(upload);  // 파일 경로 정보를 FreeBoardDTO에 설정
//	    }
		
		for (FreeBoardDTO dto : list) {
		    System.out.println("idx: " + dto.getIdx() + ", filePath: " + dto.getFilePath());
		}

		
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	
	// 게시글 조회 , 댓글 목록 조회
	@GetMapping("/view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx, HttpServletResponse response, HttpServletRequest request) {  
		ModelAndView mav = new ModelAndView("freeBoard/view"); 
		// 게시글 조회

		
		FreeBoardDTO dto = freeBoardService.selectOne(idx);
		mav.addObject("dto", dto);
		
		System.out.println("filePath: " + dto.getFilePath());
		
		
		// 댓글 목록 조회
		List<FreeBoardReplyDTO> replyList = freeBoardReplyService.getReply(idx);
		mav.addObject("replyList", replyList);
		
		// 댓글 개수 띄우기
		int replyCount = freeBoardService.replyCount(idx);
		dto.setReplyCount(replyCount);
		mav.addObject("replyCount", replyCount);
		
		
		
	
		freeBoardService.reduceViewCnt(idx, response,request);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null && auth.isAuthenticated()) {
			String userid = auth.getName();
			String nick = freeBoardService.getnick(userid);
			mav.addObject("nickname",nick);
		}
		
		
		return mav;
	}
	
	
	// 댓글 작성
	@PostMapping("/view/{idx}")
	public String writeReply(@PathVariable("idx") int idx, FreeBoardReplyDTO reply) {
		freeBoardReplyService.writeReply(reply);
		return "redirect:/freeBoard/view/" + idx;
	}

	
	 // 게시글 작성
		@PostMapping("/write")
		public String upload(FreeBoardDTO dto) {
			int row = freeBoardService.write(dto);
			System.out.println(row != 0? "추가성공" : "추가실패");
			return "redirect:/freeBoard";
		}
	
	
	// 닉네임 받아오기 
	@GetMapping("/write")
	public ModelAndView getnickname() {
		ModelAndView mav = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth != null && auth.isAuthenticated()) {
			String userid = auth.getName();
			String nick = freeBoardService.getnick(userid);
			mav.addObject("nickname",nick);
			return mav;
		}
		return null;
	}	

	
	
	
	
	// 게시글 삭제
	@GetMapping("/deleteFreeBoard/{idx}")
	public String deleteFreeBoard(@PathVariable("idx") int idx) {
		int row = freeBoardService.deleteFreeBoard(idx);
		System.out.println(row + "행이 삭제되었습니다.");
		return "redirect:/freeBoard";
	}
	
	// 게시글 수정 
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
	
	
	
	// 댓글 수정 삭제
	@GetMapping("/modifyReply/{idx}")
	public ModelAndView modifyReply(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/freeBoard/modifyReply");
		List<FreeBoardReplyDTO> dto = freeBoardReplyService.getReply(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modifyReply/{idx}")
	public String modifyReply(FreeBoardReplyDTO dto) {
		freeBoardReplyService.updateReply(dto);
		return "redirect:/freeBoard";
	}
	
	@GetMapping("/deleteReply/{idx}")
	public String deleteReply(@PathVariable("idx") int idx, Integer freeBoardIdx) {
		
		freeBoardIdx = freeBoardReplyService.getFreeBoardIdx(idx);
		
		int row = freeBoardReplyService.deleteReply(idx);
		System.out.println(row + "행이 삭제되었습니다.");
		System.out.println("freeBoardIdx" + freeBoardIdx );
		return "redirect:/freeBoard/view/" + freeBoardIdx;
	}
	
	

	

	

}
