package com.media.dto;

import lombok.Data;

@Data
public class CarDto {
	private int car_seq;
	private String car_num;
	private String car_type;
	private String oil_type;
	private String car_option;
	private String zone;
	private int rent_amt;
	private int drive_amt;
	private String car_img;
	private String cid;
	private String car_size;
}
