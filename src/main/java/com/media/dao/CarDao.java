package com.media.dao;

import java.util.*;

import com.media.dto.BfileDto;
import com.media.dto.CarDto;
import com.media.dto.CfileDto;

public interface CarDao {
	
	public List<CarDto> getClist(Map<String, String> clmap);
	
	public int getCarCount();
	
	public CarDto getCarContents(Integer car_seq);
	
	public CarDto getCarInfo(String carnum);

	public void carInsert(CarDto car) ;
	
	public void fileInsert(Map<String, String> fmap);
	
	public List<CfileDto> getCfList(Integer car_seq);
	
	public String getOriName(String sysFileName);
	
	public void carUpdate(CarDto car);
	
	public void carDelete(CarDto car);
	
	public void contentsDelete(int car_seq);
	
	public void fileDelete(int car_seq);

	public int carNumCheck(String car_num);

}
