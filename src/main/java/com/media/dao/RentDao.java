package com.media.dao;

import java.util.*;

import com.media.dto.CarDto;
import com.media.dto.MemberDto;
import com.media.dto.RentDto;

public interface RentDao {

	public List<CarDto> getRclist(Map<String, String> lmap);

	public int getRcarCount();

	public List<CarDto> getTypeList(String zone);

	public CarDto getRcarContents(String car_num);

	public List<CarDto> getRcList(Map<String, String> lmap);

}
