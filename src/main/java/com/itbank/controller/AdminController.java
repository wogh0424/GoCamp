package com.itbank.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.LoginService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired private LoginService loginService;

	@PostMapping("/modifyAuth")
	public String modifyAuth(MemberDTO dto) {
		int row = loginService.ChangeAuth(dto);
		System.out.println(dto.getEnabled());
		System.out.println(dto.getAuthority());
		System.out.println(row != 0 ? "수정성공" : "수정실패");
		return "redirect:/admin/adminHome";
	}
	
	@GetMapping("/adminHome")
	public ModelAndView getUser(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView("/admin/adminHome");
		List<MemberDTO> list = loginService.getUser();
		mav.addObject("list",list);
		return mav;
	}
	
	@GetMapping("/ControluserBoard")
	public ModelAndView ControluserBoard(@RequestParam("userid") String userid) {
		ModelAndView mav = new ModelAndView();		
		System.out.println(userid);
		return null;		
	}
}

