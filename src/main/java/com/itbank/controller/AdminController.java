package com.itbank.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.model.MemberDTO;


@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@GetMapping("/adminHome")
	public String home(Locale locale, Model model) {
		logger.info("Welcome Admin Home!");
		
		return "admin/adminHome";
	}
	
	@PostMapping("/modifyAuth")
	public String modifyAuth(MemberDTO dto) {
		int row = 0;
		System.out.println(dto.getROLE_ADMIN());
		System.out.println(dto.getROLE_USER());
		System.out.println(dto.getROLE_ENABLED());
		return null;
	}
}
