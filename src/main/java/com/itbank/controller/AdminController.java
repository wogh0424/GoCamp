package com.itbank.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.model.MemberDTO;
import com.itbank.service.LoginService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired private LoginService loginService;
	
	@GetMapping("/adminHome")
	public String home(Locale locale, Model model) {
		logger.info("Welcome Admin Home!");
		
		return "admin/adminHome";
	}
	
	@PostMapping("/modifyAuth")
	public String modifyAuth(MemberDTO dto) {
		int row = loginService.ChangeAuth(dto);
		System.out.println(dto.getEnabled());
		System.out.println(dto.getAuthority());
		System.out.println(row != 0 ? "수정성공" : "수정실패");
		return "redirect:/admin/grantAuth";
	}
}
