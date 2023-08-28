package com.itbank.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;

	@GetMapping("/main")
	public ModelAndView importMember(Principal principal) {
		ModelAndView mav = new ModelAndView("/mypage/main");
		String userid = principal.getName();
		MemberDTO dto = mypageService.importMember(userid);
		int startidx = 9;
		int endidx = 12;
		String pnum = dto.getPnum();
		// 전화번호에 - 이 있으면 그대로 replaceChar 함수 실행
		if(pnum.length() == 13) {
		String modifypnum = replaceChar(pnum, startidx, endidx);
		dto.setPnum(modifypnum);
		System.out.println(modifypnum);
		// 전화번호에 - 이 없으면 - 을 붙혀주고 replaceChar 함수 실행
		}else if(pnum.length() == 11) {
			StringBuilder stringBuilder = new StringBuilder(pnum);
			stringBuilder.insert(3, "-");
			stringBuilder.insert(8, "-");
			
			String modifiedPnum = stringBuilder.toString();
			String modifypnum = replaceChar(modifiedPnum, startidx, endidx);
			dto.setPnum(modifypnum);
		}
		mav.addObject("dto", dto);
		return mav;
	}

	// 비밀번호의 마지막번째는 **** 로 표시
	public static String replaceChar(String pnum, int startidx, int endidx) {
		if (pnum == null || startidx < 0 || endidx >= pnum.length()) {
			return pnum;
		}
		char[] pnumArr = pnum.toCharArray();
		for (int i = startidx; i <= endidx; i++) {
			pnumArr[i] = '*';
		}
		return new String(pnumArr);
	}
}