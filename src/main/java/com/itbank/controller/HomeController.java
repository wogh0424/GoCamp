package com.itbank.controller;

import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.GocampReviewDTO;
import com.itbank.model.ItemDTO;
import com.itbank.service.CampService;
import com.itbank.service.GocampReviewService;
import com.itbank.service.LoginService;

@Controller
public class HomeController {

	@Autowired
	private LoginService loginService;
	@Autowired private CampService campService;
	@Autowired private GocampReviewService gocampReviewService;
	

	@RequestMapping("/")
	public ModelAndView home(Locale locale, Model model, HttpSession Session, HttpServletRequest request,
			Principal principal) {
		if (principal != null) {
			String userid = principal.getName();
			String Permission = loginService.getPermission(userid);
			if (Session != null || request.isRequestedSessionIdValid()) {
				Session = request.getSession();
				Session.setAttribute("permission", Permission);
			}
		}
		ModelAndView mav = new ModelAndView("/home");
		
		
		List<ItemDTO> list = campService.selectBest5();
		mav.addObject("camplist", list);
		
		List<GocampReviewDTO> reviewList = gocampReviewService.selectMainReview();
		mav.addObject("reviewList", reviewList);
		return mav;
	}
	
}
