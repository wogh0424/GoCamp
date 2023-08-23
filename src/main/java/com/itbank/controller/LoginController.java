package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired private LoginService loginService;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@GetMapping("/login/loginForm")
	public String loginForm(Locale locale, Model model) {
		logger.info("Welcome Login Form!");	
		return "login/loginForm";
	}
	
	
	@GetMapping("/login/accessDenied")
	public String accessDenied(Locale locale, Model model) {
		logger.info("Welcome Access Denied!");
		
		return "login/accessDenied";
	}
	
	@GetMapping("/login/signup")
	public String signup(Locale locale, Model model) {
		logger.info("Welcone Signup Form");
		return "/login/signup";
	}
	
	@PostMapping("/login/signup") 
		public String signup(MemberDTO dto){
			int row = 0;
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String pw = encoder.encode(dto.getUserpw());
			dto.setUserpw(pw);
			row = loginService.signup(dto);
			System.out.println("homeController값 : "+row);
			System.out.println(dto.getUserpw());
			System.out.println(row != 0 ? "가입성공" : "가입실패");
			return "redirect:/";	
	}
	
	@GetMapping("/admin/grantAuth")
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView("/admin/grantAuth");
		List<MemberDTO> list = loginService.getUser();
		mav.addObject("list",list);
		return mav;
	}
	
//	@GetMapping("/login/loginForm")
//	public void login() {}
//	
//	@PostMapping("/login/loginForm")
//	public String login(MemberDTO dto, HttpSession session) {
//		MemberDTO login = memberService.login(dto);
//		session.setAttribute("login", login);
//		return "redirect:/";
//	}
}
