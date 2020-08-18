package com.media.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.media.controller.HomeController;
import com.media.dto.MemberDto;

public class IdFindDao {
	

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public static List<MemberDto> findId(MemberDto dto) throws Exception {
		// TODO Auto-generated method stub
		logger.info("이메일찾기 dao진입");
		logger.info(dto.toString());
		return null;//SqlSession.selectList(namespace + ".findId" , dto);
	}

}
