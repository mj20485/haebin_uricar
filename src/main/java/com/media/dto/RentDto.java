package com.media.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RentDto {
	private int rent_num;
	private Timestamp start_date;
	private Timestamp end_date;
	private String rent_amt;
	private String car_num;
	private String cid;
	private String mid;
}
