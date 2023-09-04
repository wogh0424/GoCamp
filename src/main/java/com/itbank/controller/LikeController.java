//package com.itbank.controller;
//
//import java.security.Principal;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.itbank.model.ItemDTO;
//import com.itbank.model.MemberDTO;
//import com.itbank.service.LikeService;
//import com.itbank.service.MypageService;
//
//@RequestMapping("/main")
//@Controller
//public class LikeController {
//	
//	@Autowired
//	private LikeService likeService;
//	private MypageService mypageService;
//	// 찜하기 
//	
//
//	@GetMapping("/like")
//	public ModelAndView selectLike(Principal principal, @RequestParam("gocamp") String gocamp) {
//		ModelAndView mav = new ModelAndView();
//		
//        String userid = principal.getName();
//		MemberDTO dto = mypageService.importMember(userid);
//	    int member = dto.getIdx();
//		
//        
//        int row = likeService.saveLike(gocamp, member);
//        
//		List<ItemDTO> likes = likeService.selectLike(member);
//		if (!containsGocamp(likes, gocamp)) {
//			 likes.add(new ItemDTO());
//		}
//		mav.addObject("likes", likes);
//		
//		
//		
//		System.err.println("gocamp" + gocamp);
//		
//	    
//	    
//	    return mav; 
//	}
//	
//	private boolean containsGocamp(List<ItemDTO> likes, String gocamp) {
//		for (ItemDTO item : likes) {
//	        if (item.getContentId().equals(gocamp)) {
//	            return true; 
//	        }
//	    }
//	    return false; 
//	}
//
//	@GetMapping("/deleteLike")
//	public String deleteLike(Principal principal, @PathVariable("gocamp") String gocamp) {
//		 String userid = principal.getName();
//			MemberDTO dto = mypageService.importMember(userid);
//		    int member = dto.getIdx();
//		    
//		    int row = likeService.removeLike(gocamp, member);
//		    return "redirect:/main/view/" + gocamp;
//	}
//	
////	@GetMapping("/like")
////	@ResponseBody
////	public Map<String, Boolean> toggleLike(Principal principal, @RequestParam("gocamp") String gocamp) {
////	    String userid = principal.getName();
////	    MemberDTO dto = mypageService.importMember(userid);
////	    int member = dto.getIdx();
////	    
////	    boolean isLiked = likeService.isLiked(gocamp, member);
////	    int row = 0;
////	    
////	    if (isLiked) {
////	    	row = likeService.removeLike(gocamp, member);
////	    } else {
////	        row = likeService.saveLike(gocamp, member);
////	    }
////	    
////	    Map<String, Boolean> response = new HashMap<>();
////	    response.put("isLiked", !isLiked);
////	    
////	    return response;
////	}
//
//}
//
