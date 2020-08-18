package com.media.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {
	private int board_seq;//게시물 번호
	private String category;//카테고리
	private String title;//제목
	private String b_content;//내용
	private String answer;//답변
	private String file_name;//이미지이름
	private String role;//종류구분
	private Timestamp reg_date;//등록일
	private String mid;//아이디
	private String bid;//작성자아이디
}
