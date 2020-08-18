package com.media.dto;

import lombok.Data;

@Data
public class CardDto {
	private String card_num;//카드번호
	private String card_pw;//카드 비밀번호
	private String card_month;//카드 월
	private String card_year;//카드 년도
	private String mid;//아이디
	private String card_com;//카드회사
	private String card_cvs;//카드cvs
	private String mname;//카드 주인
}
