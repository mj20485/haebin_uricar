package com.media.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.media.dto.CarDto;
import com.media.dto.CmemberDto;
import com.media.dto.MemberDto;

public interface MemberDao {
	//패스워드를 가져오는 메소드
	public String getPassword(String id);
	//로그인한 회원 정보를 가져오는 메소드
	public MemberDto getMemInfo(String id);
	//회원 가입 처리 메소드
	public void memberInsert(MemberDto member);
	//중복 ID 확인 메소드
	public int idCheck(String mid);
	//포인트 증가 메소드
	public void pointUp(String mid);
	
	public List<String> findId(MemberDto dto);
	
	public List<String> findId(CarDto dto);
	
	public void new_pwdUpdate(MemberDto member);
	
	public void new_emailUpdate(MemberDto member);
	
	public List<MemberDto> getMlist(Map<String, String> lmap);
	
	public int getMemberCount();
	
	public void new_phoneUpdate(MemberDto member);
	
	public void new_addressUpdate(MemberDto member);
	
	public void changepass(HashMap<String, Object> rmap);
	   
	public MemberDto pwfind(String email);
	
	public void cardDelete(String card_num);
	
	public void cmchangepass(HashMap<String, Object> rmap);
}