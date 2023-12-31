package com.itbank.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.itbank.model.CouponDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.UserDetailsDto;

@Repository
public interface LoginDao{

	public UserDetailsDto selectUser(String userid);

	public ArrayList<String> getAuthList(String userid);

	public MemberDTO checkAdmin(MemberDTO dto);

	public int checkDup(String userid);

	public int signup(MemberDTO dto);

	public int setAuth(String userid);

	public List<MemberDTO> adminpage();

	public MemberDTO importMember(String userid);

	public String checkPw(String userid);

	public int changePw(Map<String, String> map);

	public String getPermission(String userid);

	public int changeAuth(MemberDTO dto);

	public int banUser(MemberDTO dto);

	public int getMemberIdx(String userid);

	public List<MemberDTO> checkEnabled(String userid);

	public int couponcheck(CouponDTO dto);

	public List<CouponDTO> couponSelectAll(String userid);

}
