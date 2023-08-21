package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itbank.model.UserDetailsDto;

@Service("userLoginAuthenticationProvider")
public class UserLoginAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	UserDetailsService userDetailsService;

	@Autowired
	BCryptPasswordEncoder pwEncoding;

	@Override
	public Authentication authenticate(Authentication authentication){
		String userId = authentication.getName();
		String userPw = (String) authentication.getCredentials();
		UserDetailsDto userDetails = (UserDetailsDto) userDetailsService.loadUserByUsername(userId);
		System.out.println("provider : " + userPw);
		System.out.println("dto : " + userDetails.getPassword());
		if (userDetails == null || !userId.equals(userDetails.getUsername())
				|| !pwEncoding.matches(userPw, userDetails.getPassword())) {
			
			throw new BadCredentialsException(userId);

			// 계정 정보 맞으면 나머지 부가 메소드 체크 (이부분도 필요한 부분만 커스터마이징 하면 됨)
			// 잠긴 계정일 경우
		} else if (!userDetails.isAccountNonLocked()) {
			throw new LockedException(userId);

			// 비활성화된 계정일 경우
		} else if (!userDetails.isEnabled()) {
			throw new DisabledException(userId);

			// 만료된 계정일 경우
		} else if (!userDetails.isAccountNonExpired()) {
			throw new AccountExpiredException(userId);

			// 비밀번호가 만료된 경우
		} else if (!userDetails.isCredentialsNonExpired()) {
			throw new CredentialsExpiredException(userId);
		}

		// 다 썼으면 패스워드 정보는 지워줌 (객체를 계속 사용해야 하므로)
		UserDetailsDto.setPassword(null);

		/* 최종 리턴 시킬 새로만든 Authentication 객체 */
		Authentication newAuth = new UsernamePasswordAuthenticationToken(userDetails, null,
				userDetails.getAuthorities());
		System.out.println("auth : " + newAuth);
		return newAuth;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}
