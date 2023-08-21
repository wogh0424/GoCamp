package com.itbank.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.MemberDTO;
import com.itbank.repository.LoginDao;
import com.itbank.service.LoginService;

@RestController
public class AjaxController {

	@Autowired private LoginService loginService;
	
	@Autowired private LoginDao dao;
	
//	@PostMapping("/Adminlogin")
//	public HashMap<String, Object> checkAdmin(@RequestBody MemberDTO dto){
//		System.out.println(dto.getAdminid());
//		System.out.println(dto.getAdminpw());
//		MemberDTO dto1 = loginService.checkAdmin(dto);
//
//		
//		HashMap<String, Object> result = new HashMap<>();
//		result.put("admin", dto1.getUserid());
//		result.put("status", dto1.getUserid() != null);
//		return null;
//	}
	
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
}
