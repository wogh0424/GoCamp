package com.itbank.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDTO;
import com.itbank.repository.LoginDao;


@Service
public class MypageService {

	@Autowired private LoginDao dao;
	
	@Autowired BCryptPasswordEncoder pwEncoding;
	
	public MemberDTO importMember(String userid) {
		return dao.importMember(userid);
	}

	public int checkPw(String currentuserpw, String userid
							) {
		String userpw = dao.checkPw(userid);
		int result = 0;
		if(pwEncoding.matches(currentuserpw, userpw)) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}

	public int getMemberIdx(String userid) {
		return dao.getMemberIdx(userid);
	}

	

}
