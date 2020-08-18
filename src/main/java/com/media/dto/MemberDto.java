package com.media.dto;

import lombok.Data;

@Data
public class MemberDto {
	private String mid;//아이디
	private String name;//이름
	private String phone;//전화번호
	private String address;//주소
	private String license_type;//면허종류
	private String license_num;//면허번호
	private int license_end;//면허만료일
	private int license_start;//면허 발급일
	private String birth;//생년월일
	private String gender;//성별
	private String email;//이메일
	private String mmout;//탈퇴여부
	private String password;//비밀번호
}
