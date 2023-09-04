package com.itbank.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.ImageDTO;
import com.itbank.model.ItemDTO;
import com.itbank.service.CampService;
import com.itbank.service.LoginService;
import com.itbank.service.MypageService;

@RestController
public class AjaxController {

	@Autowired private LoginService loginService;
	@Autowired private MypageService mypageService;
	@Autowired private CampService campService;
	
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
	
	// 정민's ajaxController
	@PostMapping("/imageStatus")
	public boolean imageStatus(@RequestBody ImageDTO imageUrl) {
		return checkImageExists(imageUrl.getImageUrl());
	}
	
	private boolean checkImageExists(String imageUrl) {
        try {
            URL url = new URL(imageUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("HEAD");
            int responseCode = connection.getResponseCode();
            return responseCode == HttpURLConnection.HTTP_OK;
        } catch (IOException e) {
            return false;
        }
    }
	
	@GetMapping("/autocompletion")
	public List<ItemDTO> autocompletion() {
		String any = "";
		List<ItemDTO> list = campService.searchByKeyWord(any);
		return list;
	}
	///////////////////////////////////   정민's ajaxController end/
	
	
	
	// 연지's ajaxController
	
//	@PostMapping("selectOne")
//	public String select
}
