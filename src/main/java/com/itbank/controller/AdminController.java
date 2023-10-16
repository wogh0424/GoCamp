package com.itbank.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itbank.model.AdminDTO;
import com.itbank.model.CouponDTO;
import com.itbank.model.CampDTO;
import com.itbank.model.FreeBoardDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.AdminService;
import com.itbank.service.CampService;
import com.itbank.service.FreeBoardService;
import com.itbank.service.LoginService;
import com.itbank.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private LoginService loginService;
	@Autowired private FreeBoardService freeBoardService;
	@Autowired private AdminService adminService;
	@Autowired private CampService campService;

	@PostMapping("/modifyAuth")
	public String modifyAuth(MemberDTO dto) {
		int row = loginService.ChangeAuth(dto);
		System.out.println(dto.getEnabled());
		System.out.println(dto.getAuthority());
		System.out.println(row != 0 ? "수정성공" : "수정실패");
		return "redirect:/admin/adminpage";
	}

	@GetMapping("/Sales")
	public void Sales() {}
	
	@GetMapping("/adminpage")
	public ModelAndView requestData(HttpServletRequest request, Model model) {
		ModelAndView mav = new ModelAndView("/admin/adminpage");
		List<MemberDTO> list = loginService.adminpage();
		List<AdminDTO> adminList = adminService.requestReport();

		mav.addObject("list",list);
		mav.addObject("adminList",adminList);

		return mav;
	}
	
	@GetMapping("/ControluserBoard")
	public ModelAndView adminData(String nickname) {
		ModelAndView mav = new ModelAndView("/admin/ControluserBoard");
		List<FreeBoardDTO> list = freeBoardService.userboard(nickname);
		mav.addObject("list",list);
		return mav;
	}	
	
	@PostMapping("/BannedReason")
	public String BannedReason(AdminDTO dto,  RedirectAttributes redirectAttributes, Principal principal) {
		String userid = principal.getName();
		dto.setUserid(userid);
		System.out.println(dto.getUserid() + ": controller의 userid");
		System.out.println(dto.getIdx());
		int row = freeBoardService.reasonDeletion(dto);
		if(row != 0) {
		freeBoardService.deleteFreeBoard(dto.getIdx());
		}
	    redirectAttributes.addAttribute("nickname", dto.getNickname());

		System.out.println(row != 0 ? "삭제성공" : "삭제실패");
		return "redirect:/admin/ControluserBoard";
	}
}
