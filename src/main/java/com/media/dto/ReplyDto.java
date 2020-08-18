package com.media.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyDto {
	private int reply_seq;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp r_date;
	private String r_content;
	private int board_seq;
	private String mid;
}
