package com.itbank.model;

public class MemberDTO {

	private String userid;
	private String userpw;
	private String email;
	private String username;
	private String nickname;
	private String pnum;
	private String birth;
	private String authority;
	private String ROLE_USER;
	private String ROLE_ADMIN;
	private String ROLE_ENABLED;
	

	
	public String getROLE_USER() {
		return ROLE_USER;
	}
	public void setROLE_USER(String rOLE_USER) {
		ROLE_USER = rOLE_USER;
	}
	public String getROLE_ADMIN() {
		return ROLE_ADMIN;
	}
	public void setROLE_ADMIN(String rOLE_ADMIN) {
		ROLE_ADMIN = rOLE_ADMIN;
	}
	public String getROLE_ENABLED() {
		return ROLE_ENABLED;
	}
	public void setROLE_ENABLED(String rOLE_ENABLED) {
		ROLE_ENABLED = rOLE_ENABLED;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	
}
