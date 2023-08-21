package com.itbank.model;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


public class UserDetailsDto implements UserDetails{
	
	private String USERID;
	private String USERPW;
	private boolean ENABLED;
	private ArrayList<GrantedAuthority> authority;
	// 5. 반환된 DB값은 여기서 권한을 확인하기 위해 GrantedAuthority함수의 auth배열에 넣어진다.
	// 6. 이렇게 들어가면 security-context에서 권한을 검증하고 페이지의 접근가능여부를 판단한다
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authority;
	}
	
	public void setAuthority(ArrayList<String> authList) {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		for(int i=0;i<authList.size();i++) {
			auth.add(new SimpleGrantedAuthority(authList.get(i)));
		}
		this.authority=auth;
	}

	public String getUSERID() {
		return USERID;
	}

	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}

	public String getUSERPW() {
		return USERPW;
	}

	public void setUSERPW(String uSERPW) {
		USERPW = uSERPW;
	}

	public boolean isENABLED() {
		return ENABLED;
	}

	public void setENABLED(boolean eNABLED) {
		ENABLED = eNABLED;
	}

	public ArrayList<GrantedAuthority> getAuthority() {
		return authority;
	}


	@Override
	public String getPassword() {
		
		return USERPW;
	}

	@Override
	public String getUsername() {		
		return USERID;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return ENABLED;
	}

	public static void setPassword(Object object) {
		// TODO Auto-generated method stub
		
	}
}
