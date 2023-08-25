package com.itbank.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.FreeBoardDTO;
import com.itbank.model.MemberDTO;
import com.itbank.repository.LoginDao;
import com.itbank.service.FreeBoardService;
import com.itbank.service.LoginService;
import com.itbank.service.MypageService;

@RestController
public class AjaxController {

	@Autowired private LoginService loginService;
	@Autowired private MypageService mypageService;
	@Autowired private LoginDao dao;
	
	@Autowired private FreeBoardService freeBoardService;
	
	@GetMapping("/dupCheck/{userid}")
	public int dupCheck(@PathVariable("userid") String userid) {
		int row = loginService.dupCheck(userid);
		return row;
	}
	
	@GetMapping("/sendAuthNumber/{email}")
	public HashMap<String, Object> sendAuthNumber(@PathVariable("email") String email, HttpSession session) throws IOException{
		System.out.println("email : " + email);
		int row = loginService.sendAuthNumber(email);
		if(row != 0) {
			session.setAttribute("authNumber", row);
			session.setMaxInactiveInterval(180);
		}
		HashMap<String, Object> result = new HashMap<>();
		result.put("success", row > 0 ? 1 : 0);
		result.put("message", row > 0 ? "메일이 발송되었습니다" : "메인 정송에 실패했습니다");
		return result;
	}
	
	@GetMapping("/checkAuthNumber/{authNumber}")
	public int checkAuthNumber(@PathVariable("authNumber") int authNumber, HttpSession session) {
		int sessionNumber = (int)session.getAttribute("authNumber");
		session.setMaxInactiveInterval(1800);
		System.out.println(authNumber + " : controller authNumber");
		System.out.println(sessionNumber + " : controller sessionNumber");
		return authNumber == sessionNumber ? 1 : 0;
	}
	
	
	@GetMapping("/checkPw/{currentuserpw}")
	public int checkPw(@PathVariable("currentuserpw") String currentuserpw,
			Principal principal) {
		String userid = principal.getName();
		int result = mypageService.checkPw(currentuserpw, userid);
		System.out.println(result);
		return result;
	}
}
