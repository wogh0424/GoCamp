package com.itbank.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.ImageDTO;
import com.itbank.model.IncomeDTO;
import com.itbank.model.ItemDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.PaylistDTO;
import com.itbank.model.Product_fileDTO;
import com.itbank.model.ReportDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.SalesDTO;
import com.itbank.model.SearchDTO;
import com.itbank.service.AdminService;
import com.itbank.service.CampService;
import com.itbank.service.LoginService;
import com.itbank.service.MypageService;
import com.itbank.service.ProductService;
import com.itbank.service.RecommendService;

@RestController
public class AjaxController {

	@Autowired
	private LoginService loginService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private CampService campService;
	@Autowired
	private ProductService productService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private RecommendService recommendService;

	@GetMapping("/dupCheck/{userid}")
	public int dupCheck(@PathVariable("userid") String userid) {
		int row = loginService.dupCheck(userid);
		return row;
	}

	@GetMapping("/sendAuthNumber/{email}")
	public HashMap<String, Object> sendAuthNumber(@PathVariable("email") String email, HttpSession session)
			throws IOException {
		System.out.println("email : " + email);
		int row = loginService.sendAuthNumber(email);
		if (row != 0) {
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
		int sessionNumber = (int) session.getAttribute("authNumber");
		session.setMaxInactiveInterval(1800);
		System.out.println(authNumber + " : controller authNumber");
		System.out.println(sessionNumber + " : controller sessionNumber");
		return authNumber == sessionNumber ? 1 : 0;
	}

	@GetMapping("/checkPw/{currentuserpw}")
	public int checkPw(@PathVariable("currentuserpw") String currentuserpw, Principal principal) {
		String userid = principal.getName();
		int result = mypageService.checkPw(currentuserpw, userid);
		System.out.println(result);
		return result;
	}

	// 정민's ajaxController ///////////////////////////////////////
	// 이미지가 존재하는지 판단한다.
	@PostMapping("/imageStatus")
	public boolean imageStatus(@RequestBody ImageDTO imageSrc) {
		return checkImageExists(imageSrc.getImageSrc());
	}

	// (view)이미지가 존재하는지 판단한다.
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

	// (view, modify)DB에서 이미지 url들을 가져온다.
	@GetMapping("/getImageList/{contentId}")
	private List<String> getImageList(@PathVariable("contentId") String contentId) {
		List<String> imageList = campService.getImageList(contentId);
		return imageList;
	}

	// (modify) 이미지를 하나 삭제한다.
	@PostMapping("/deleteImageItem")
	private boolean deleteImageItem(@RequestBody ImageDTO imageInfo) {
		return campService.deleteImageItem(imageInfo);
	}

	// (camp) 자동완성을 위한 데이터를 불러온다.
	@PostMapping("/autocompletion")
	private List<String> autocompletion(@RequestBody SearchDTO dto) {
		return campService.autocompletion(dto);
	}

	/////////////////////////////////////////////////////////////////////////
	// 콘텐츠 아이디 중복을 체크한다.
	@GetMapping("/cidDupCheck/{contentId}")
	public boolean cidDupCheck(@PathVariable("contentId") String contentId) {
		boolean check = campService.cidDupCheck(contentId);
		return check;
	}

	@GetMapping("/login/checkBan")
	public List<MemberDTO> checkEnabled(@RequestParam("userid") String userid) {
		List<MemberDTO> list = loginService.checkEnabled(userid);
		return list;
	}

	// 정현's ajaxController
	@GetMapping("/showProductImage/{idx}")
	public List<Product_fileDTO> showProductImage(@PathVariable("idx") int idx) {
		List<Product_fileDTO> list = productService.showProductImages(idx);
		return list;
	}

	@PostMapping("/grocery")
	public int grocery(@RequestBody ProductDTO dto) {
		int row = productService.grocery(dto);
		return row;
	}

	@GetMapping("/admin/requestYesternayData")
	public List<SalesDTO> requestYesternayData() {
		List<SalesDTO> list = adminService.requestYesternayData();
		return list;
	}

	@GetMapping("/admin/requestTodayChartData")
	public List<SalesDTO> requestTodayChartData() {
		List<SalesDTO> list = adminService.requestTodayChartData();
		return list;
	}

	@GetMapping("/admin/requestincome")
	public List<IncomeDTO> requestincome() {
		List<IncomeDTO> originalList = adminService.requestincome();
		List<IncomeDTO> formattedList = new ArrayList<>();

		for (IncomeDTO originaldto : originalList) {
			IncomeDTO formattedDTO = new IncomeDTO();

			// 복사 필드들
			formattedDTO.setDate(originaldto.getDate()); // Date 필드 복사

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = dateFormat.format(originaldto.getDate());

			formattedDTO.setFormattedDate(formattedDate);
			formattedDTO.setIncome(originaldto.getIncome());
			formattedList.add(formattedDTO);
		}

		return formattedList;
	}

	// 게시글 수정 내 파일 삭제
	@PostMapping("/deletefile")
	private boolean deletefile(@RequestBody Product_fileDTO dto) {
		return productService.deletefile(dto.getFilePath());
	}
	
	// 쿠폰 발급
	@GetMapping("/coupon/{userid}")
	public int coupon (@PathVariable("userid") String userid) {
		int row = loginService.couponcheck(userid);
		return row;
	}
	
	@PostMapping("/gotopay")
	public int gotopay (@RequestBody PaylistDTO dto) {
		int row = productService.gotopay(dto);
		return row;
	}
	
	
	// 연지's AjaxController

	@GetMapping("/reviewRecommend/{reviewId}")
	public HashMap<String, Object> recommend(@PathVariable("reviewId") int review, Principal principal) {
		HashMap<String, Object> map = new HashMap<>();

		if (principal != null) {
			String userid = principal.getName();
			MemberDTO dto = mypageService.importMember(userid);
			int member = dto.getIdx();

			boolean isReviewRecommended = recommendService.isReviewRecommended(review, member);
			int getReviewRecommendCount = recommendService.getReviewRecommendCount(review);

	
			map.put("isReviewRecommended", isReviewRecommended);
			map.put("getReviewRecommendCount", getReviewRecommendCount);

		}

		return map;
	}

	// 캠핑장리뷰 추천수

	// 추천하기
	@PostMapping("/reviewRecommend/{reviewId}")
	@ResponseBody
	public int insertReviewRecommend(Principal principal, @PathVariable("reviewId") int review) {

		int row = 0;

		if (principal != null) {
			String userid = principal.getName();
			MemberDTO dto = mypageService.importMember(userid);
			int member = dto.getIdx();

			row = recommendService.insertReviewRecommend(review, member);
		}

		return row;
	}

	// 추천취소
	@PostMapping("/reviewDisRecommend/{reviewId}")
	@ResponseBody
	public int deleteReviewRecommend(Principal principal, @PathVariable("reviewId") int review) {

		int row = 0;

		if (principal != null) {
			String userid = principal.getName();
			MemberDTO dto = mypageService.importMember(userid);
			int member = dto.getIdx();

			row = recommendService.deleteReviewRecommend(review, member);
		}
		return row;
	}

	@GetMapping("/admin/requestReportedData")
	private List<ReportDTO> requestReportedData() {
		List<ReportDTO> originalList = adminService.requestReportedData();
		List<ReportDTO> formattedList = new ArrayList<>();

		for (ReportDTO originaldto : originalList) {
			ReportDTO formattedDTO = new ReportDTO();

			// 복사 필드들
			formattedDTO.setReportedDate(originaldto.getReportedDate()); // Date 필드 복사

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = dateFormat.format(originaldto.getReportedDate());

			formattedDTO.setFormattedDate(formattedDate);
			formattedDTO.setReportedReason(originaldto.getReportedReason());
			formattedDTO.setReported_user(originaldto.getReported_user());
			formattedDTO.setReportCount(originaldto.getReportCount());
			System.out.println(formattedDTO.getFormattedDate());
			formattedList.add(formattedDTO);
		}
		return formattedList;
	}
	
	@GetMapping("/admin/getCampList/{pageNo}")
	public List<ItemDTO> requestCamp (@PathVariable("pageNo") int page) {
		List<ItemDTO> list = campService.requestCamp(page);
		return list;
	}
}

