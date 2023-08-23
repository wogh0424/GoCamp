package com.itbank.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.MemberDTO;
import com.itbank.model.UserDetailsDto;

@Repository
public interface LoginDao {

	public UserDetailsDto selectUser(String userid);

	public ArrayList<String> getAuthList(String userid);

	public MemberDTO checkAdmin(MemberDTO dto);

	public int checkDup(String userid);

	public int signup(MemberDTO dto);

	public int setAuth(String userid);

	public List<MemberDTO> getUser();

}
