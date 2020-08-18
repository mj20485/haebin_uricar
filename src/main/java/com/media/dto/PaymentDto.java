package com.media.dto;

import lombok.Data;

@Data
public class PaymentDto {
	private int payment_seq; //결제번호
	private int payment_date; //결제일시
	private int payment_amt; //결제비용
	private String card_num; //카드번호
	private int rent_seq; //렌트번호
	private String mid; //아이디
}
