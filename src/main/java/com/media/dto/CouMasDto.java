package com.media.dto;

import lombok.Data;

@Data
public class CouMasDto {
	private int cou_mas_seq;//쿠폰마스터고유번호
	private String coupon_name;//쿠폰이름
	private int open_start_date;//발급시작일
	private int open_end_date;//쿠폰종료일
	private int ep_date;//유효기간
	private String option_header;//쿠폰사용조건
	private String option_detail;//쿠폰상세설명
	private String img_name;//이미지 이름
	private String dc_option;//할인 방식
	private int dc;//할인 수치
	private int coupon_count;//쿠폰 카운트
}
