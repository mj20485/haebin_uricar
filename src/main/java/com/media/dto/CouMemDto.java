package com.media.dto;

import lombok.Data;

@Data
public class CouMemDto {
	private int cou_mem_seq;//쿠폰고유번호
	private String use_flag;//쿠폰사용여부
	private int cou_mas_seq;//쿠폰마스터고유번호
	private String mid;//아이디
}
