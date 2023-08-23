package com.itbank.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itbank.model.FreeBoardDTO;
import com.itbank.model.PagingDTO;
import com.itbank.repository.FreeBoardDAO;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDAO dao;

	public int selectCount(HashMap<String, String> map) {
		return dao.selectCount(map);
	}

	public List<FreeBoardDTO> selectAll(PagingDTO paging) {
		return dao.selectAll(paging);
	}

	public int write(FreeBoardDTO dto) {
		return dao.insertBoard(dto);
	}

	// 하나의 서비스 함수에서 2개 이상의 dao 함수를 호출할 때
	public FreeBoardDTO selectOne(int idx) {
//		System.out.println(row + "행이 수정되었습니다.");
		System.out.println(idx + "번 조회수 증가");
		return dao.selectOne(idx);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public int update(FreeBoardDTO dto) {
		return dao.update(dto);
	}

	public String getnick(String userid) {
		return dao.getnick(userid);
	}

	public void reduceViewCnt(int idx, HttpServletResponse response, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		boolean isVisited = true;

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("viewCount".equals(cookie.getName())) {
					isVisited = false;
					break;
				}
			}
		}
		if(isVisited) {
			dao.updateViewCount(idx);
			Cookie cookie = new Cookie("viewCount","true");
			cookie.setMaxAge(10);
			response.addCookie(cookie);
		}
		
	}
}
