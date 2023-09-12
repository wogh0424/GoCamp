package com.itbank.controller;

import java.security.Principal;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	@PostMapping("/login/loginForm")
	public String checkparam(MemberDTO dto) {
		System.out.println(dto.getUserid() + ": 로그인 컨트롤러의 아이디");
		
		return null;
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
			String pnum = dto.getPnum();
			// 전화번호에 - 이 있으면 그대로 replaceChar 함수 실행
			if(pnum.length() == 13) {
			return pnum;
			// 전화번호에 - 이 없으면 - 을 붙혀주고 replaceChar 함수 실행
			}else if(pnum.length() == 11) {
				StringBuilder stringBuilder = new StringBuilder(pnum);
				stringBuilder.insert(3, "-");
				stringBuilder.insert(8, "-");
				
				String modifiedPnum = stringBuilder.toString();
				dto.setPnum(modifiedPnum);
			}
			
			row = loginService.signup(dto);
			System.out.println("homeController값 : "+row);
			System.out.println(dto.getUserpw());
			System.out.println(row != 0 ? "가입성공" : "가입실패");
			return "redirect:/";	
	}
	
	
	
	@PostMapping("/changePw")
	public String changePw(MemberDTO dto,
							Principal principal) {
		String userid = principal.getName();
		int row = loginService.changePw(dto,userid);
		
			System.out.println(row != 0? "변경성공" : "변경실패");
		return "/home";
	}
	
	@GetMapping("/login/register")
	public void register() {}
}
