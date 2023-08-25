package com.itbank.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itbank.component.MailComponent;
import com.itbank.model.MemberDTO;
import com.itbank.model.UserDetailsDto;
import com.itbank.repository.LoginDao;

@Service("loginService")
// @Service() 괄호안에 loginService 이렇게 이름을 지정해준 이유는 security-context에서
//   <s:authentication-provider user-service-ref="loginService" /> 이렇게 이 서비스 이름을 지정해줘서 서비스 클래스를 찾기위함이다
//평문과 평문의 비교면 윗줄처럼 기본으로 내장된authentication-provider 함수를 사용해도 괜찮지만 암호화를 한 경우 match함수를 사용해야하기 때문에  UserLoginAuthenticationProvider 로 
//필터링을 전가
public class LoginService implements UserDetailsService{	
	@Autowired private MailComponent mailComponent;
	@Autowired LoginDao dao;
	
	private Random ran = new Random();
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired BCryptPasswordEncoder pwEncoding;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		System.out.println("Service : " + userid);
		ArrayList<String> authList = new ArrayList<String>();
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		// sqlSession은 mybatis의 sql데이터와 상호작용을 할수있게 도와주는 기능이다
		
		UserDetailsDto userDetailsDto = dao.selectUser(userid);
		// 3. security-context에서 날라온 값은 dao로 간다
		// 4. 반환된 DB값을 Dto로 보낸다.
		authList = dao.getAuthList(userid);
		
		// 반환값을 dto로 넘기고 DB값과 auth.class에서 입력값과 암호화값을 비교
		if (userDetailsDto == null) { //User을 찾지 못했을 경우
			throw new UsernameNotFoundException(userid);
		}
		else {
			userDetailsDto.setAuthority(authList);
		}
		
		return userDetailsDto; //완전한 UserDetails 객체
	}
	
	public int dupCheck(String userid) {
		return dao.checkDup(userid);
	}
	
	
	public int sendAuthNumber(String email) throws IOException {
		String content = "<h3>인증번호는 [%s]입니다</h3>";
		int authNumber = ran.nextInt(899999) + 100000;
		content = String.format(content, authNumber);
		int row = mailComponent.sendMail(email, content);
		
		return row > 0 ? authNumber : row;
	}
	
	
	public int signup(MemberDTO dto) {
		int row = 0;
		int row1 = 0;
		row = dao.signup(dto);
		String userid = dto.getUserid();
		row1 = dao.setAuth(userid);
		
		System.out.println(row != 0 ? "권한부여 성공" : "실패");
		return row;
	}


	public List<MemberDTO> getUser() {
		return dao.getUser();
	}


	public int changePw(MemberDTO dto, String userid) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String userpw = dto.getNewuserpw();
		System.out.println(userpw + "LoginService유저PW");
		String encodedpw = encoder.encode(userpw);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userpw", encodedpw);
		map.put("userid", userid);
		return dao.changePw(map);
	}


	public String getPermission(String userid) {
		return dao.getPermission(userid);
	}

	public int ChangeAuth(MemberDTO dto) {
		if(dto.getEnabled() != null) {
		int row = dao.banUser(dto);
		}
		return dao.changeAuth(dto);
	}
}